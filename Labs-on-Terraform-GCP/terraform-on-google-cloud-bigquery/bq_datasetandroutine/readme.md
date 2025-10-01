# Terraform Configuration for BigQuery Dataset and Routine

This directory contains Terraform configuration files for setting up a BigQuery dataset and a stored procedure in Google Cloud Platform (GCP).

## Files

*   `gcp_bq_routine.tf`: Defines the BigQuery dataset, table, and routine resources.
*   `bq_stored_proc.sql`: SQL script for the BigQuery stored procedure.
*   `variables.tf`: Defines the variables used in the Terraform configuration.
*   `gcp_service_account.tf`: Configures the service account for BigQuery.
*   `main.tf`: Configures the Google Cloud provider.

## Description

This Terraform configuration automates the creation of a BigQuery dataset, a sample table, and a stored procedure. It also manages the necessary IAM permissions for a service account to interact with these resources.

### `gcp_bq_routine.tf`

This file defines the core resources:

*   **BigQuery Dataset**:
    *   Creates a dataset named `bq_demo_dataset_1` with a specified location, description, and labels.
    *   Configures access control, granting the `roles/bigquery.dataOwner` role to a specified service account.
    *   Enables `delete_contents_on_destroy` to ensure that the dataset is emptied when destroyed.
*   **BigQuery Dataset IAM Member**:
    *   Grants the `roles/bigquery.dataOwner` role to a specified user for the dataset.
*   **BigQuery Table**:
    *   Creates a table named `bq_demo_table` within the dataset.
    *   Configures time-based partitioning and clustering.
    *   Defines the table schema using a JSON file (`schema/schema.json`).
*   **BigQuery Routine (Stored Procedure)**:
    *   Creates a stored procedure named `demo_routine_id` within the dataset.
    *   Defines the routine type, language, and security mode.
    *   The `definition_body` is populated from the `bq_stored_proc.sql` file, using template variables for the project ID, dataset ID, and table ID.

### `bq_stored_proc.sql`

This file contains the SQL code for the stored procedure. It is used as a template in `gcp_bq_routine.tf`.

### `variables.tf`

This file defines the variables used throughout the Terraform configuration:

*   `project_id`: The GCP project ID.
*   `region`: The GCP region for resources.
*   `zone`: The GCP zone for resources.
*   `environment`: The environment name (e.g., "dev", "prod").
*   `owner`: The resource owner.
*   `user_by_email`: The user email address.
*   `sec_user_by_email`: Another user email address for granting permissions.

### `gcp_service_account.tf`

This file defines a service account and grants it the necessary permissions:

*   **Service Account**:
    *   Creates a service account named `bq-terraform-owner` with a display name.
*   **Project IAM Member (BigQuery Admin)**:
    *   Grants the `roles/bigquery.admin` role to the service account at the project level.
*   **Project IAM Member (User Role)**:
    *   Grants the `roles/bigquery.admin` role to a specified user at the project level.

### `main.tf`

This file configures the Google Cloud provider:

*   **Terraform**:
    *   Specifies the required Terraform version and providers.
*   **Provider**:
    *   Configures the `google` provider with the project ID, region, zone, and credentials file.

## Prerequisites

*   Terraform installed and configured.
*   A Google Cloud Platform project.
*   A service account with the necessary permissions to create and manage BigQuery resources.
*   The `schema/schema.json` file defining the schema for the BigQuery table.
*   A SQL file `bq_stored_proc.sql` with the BigQuery stored procedure.

## Usage

1.  **Configure Variables**:
    *   Modify the `variables.tf` file to set the appropriate values for your GCP project, region, and other settings.
2.  **Create Service Account**:
    *   Ensure that the service account specified in `gcp_service_account.tf` exists and has the necessary permissions.
3.  **Initialize Terraform**:
    ```shell
    terraform init
    ```
4.  **Apply Configuration**:
    ```shell
    terraform apply
    ```

## Next Steps

*   Populate the BigQuery table with data.
*   Test the stored procedure.
*   Customize the configuration to fit your specific requirements.
