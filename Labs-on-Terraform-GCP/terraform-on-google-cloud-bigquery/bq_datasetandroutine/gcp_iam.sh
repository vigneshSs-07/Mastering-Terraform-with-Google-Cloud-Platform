# Replace with your project ID and the email of the service account running Terraform
export PROJECT_ID="myorg-cloudai-gcp1722"
export SA_NAME="terraform-bq-usecase"
export TERRAFORM_SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"

echo "--- Ensuring service account '${SA_NAME}' exists ---"
# Create the service account if it doesn't exist
# This check ensures the script is idempotent (can be run multiple times without error)
gcloud iam service-accounts describe "${TERRAFORM_SA_EMAIL}" --project "${PROJECT_ID}" >/dev/null 2>&1 || \
  gcloud iam service-accounts create "${SA_NAME}" \
    --display-name="Terraform and BQ Usecase SA" \
    --project "${PROJECT_ID}"

echo "--- Granting project-level roles to '${TERRAFORM_SA_EMAIL}' ---"
# Grant the necessary roles to the Terraform service account
# 1. projectIamAdmin: Allows managing IAM policies on the project (required for google_project_iam_member)
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --quiet \
  --member="serviceAccount:${TERRAFORM_SA_EMAIL}" \
  --role="roles/resourcemanager.projectIamAdmin"

# 2. bigquery.admin: Allows full control over BigQuery resources (datasets, tables)
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --quiet \
  --member="serviceAccount:${TERRAFORM_SA_EMAIL}" \
  --role="roles/bigquery.admin"

# 3. iam.serviceAccountAdmin: Allows managing other service accounts (e.g., creating 'bqowner')
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --quiet \
  --member="serviceAccount:${TERRAFORM_SA_EMAIL}" \
  --role="roles/iam.serviceAccountAdmin"

# 4. iam.serviceAccountUser: Allows impersonating other service accounts
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --quiet \
  --member="serviceAccount:${TERRAFORM_SA_EMAIL}" \
  --role="roles/iam.serviceAccountUser"

# 5. serviceUsage.serviceUsageConsumer: Allows using services and APIs in the project
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --quiet \
  --member="serviceAccount:${TERRAFORM_SA_EMAIL}" \
  --role="roles/serviceusage.serviceUsageConsumer"


echo "--- Creating and downloading key for '${TERRAFORM_SA_EMAIL}' ---"
gcloud iam service-accounts keys create ~/terraform/WorkingSolution/bq_datasetandroutine/terraform-bq-usecase-key.json \
    --iam-account ${TERRAFORM_SA_EMAIL}


echo "--- Script finished successfully! ---"
