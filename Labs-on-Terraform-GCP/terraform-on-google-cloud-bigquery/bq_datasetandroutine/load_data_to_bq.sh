#!/bin/bash

# ==============================================================================
# Load JSON data into a BigQuery table
#
# This script uses the bq command-line tool to load data from a local JSON
# file into a specified BigQuery table. It uses a service account for
# authentication.  chmod +x load_data_to_bq.sh
# ==============================================================================

# --- Configuration ---
# Set your project, dataset, and table details here.
# The project ID is taken from your service account key file.
PROJECT_ID="myorg-cloudai-gcp1722"
DATASET_ID="bq_demo_dataset_1"  # <-- TODO: Replace with your BigQuery dataset ID
TABLE_NAME="bq_demo_table"    # <-- TODO: Replace with your BigQuery table name

# --- File Paths ---
# Paths to your local data, schema, and service account key files.
DATA_FILE="/home/cloudaianalytics/terraform/data/data.json"
SCHEMA_FILE="/home/cloudaianalytics/terraform/schema/schema.json"
KEY_FILE="/home/cloudaianalytics/terraform/WorkingSolution/bq_datasetandroutine/***.json"

# Temporary file for the corrected NDJSON data
NDJSON_DATA_FILE=$(mktemp)

# --- Script Body ---
set -e # Exit immediately if a command exits with a non-zero status.

echo "--- Step 1: Authenticating with Google Cloud ---"
# Activate the service account using the provided key file.
gcloud auth activate-service-account --key-file="${KEY_FILE}"
echo "Successfully authenticated."

echo "--- Step 2: Setting the gcloud project ---"
# Set the active project for gcloud and bq commands.
gcloud config set project "${PROJECT_ID}"
echo "Project set to ${PROJECT_ID}."

echo "--- Step 3: Converting JSON to Newline Delimited JSON (NDJSON) ---"
# Use jq to convert the JSON array to NDJSON. The '.[]' filter unnests the array,
# and the '-c' (compact) flag ensures each object is on a single line.
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install jq to proceed."
    exit 1
fi
jq -c '.[]' "${DATA_FILE}" > "${NDJSON_DATA_FILE}"
echo "Conversion complete. NDJSON data stored in ${NDJSON_DATA_FILE}"

echo "--- Step 4: Loading data into BigQuery ---"
# The bq load command to upload the data.
# --source_format=NEWLINE_DELIMITED_JSON: Specifies the format of the input file.
# --replace=true: Overwrites the table. Set to false to append.
bq load \
    --source_format=NEWLINE_DELIMITED_JSON \
    --replace=true \
    "${PROJECT_ID}:${DATASET_ID}.${TABLE_NAME}" \
    "${NDJSON_DATA_FILE}" \
    "${SCHEMA_FILE}"

echo "--- Success! ---"
echo "Data from ${DATA_FILE} has been loaded into ${PROJECT_ID}:${DATASET_ID}.${TABLE_NAME}"

# Clean up the temporary file
rm "${NDJSON_DATA_FILE}"
