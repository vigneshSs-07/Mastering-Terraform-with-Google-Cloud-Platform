# BigQuery Dataset and Table Deployment Guide

This guide provides a step-by-step walkthrough for deploying a BigQuery dataset and table using Terraform. It also covers how to load initial data into the created table. This setup assumes you are using a service account for running the Terraform and data loading processes.

The process is divided into three main stages:
1.  **Setup**: Preparing your local environment and ensuring your service account has the necessary permissions.
2.  **Infrastructure Deployment**: Running Terraform to create the Google Cloud resources.
3.  **Data Loading**: Running a script to load data into the newly created BigQuery table.

## Prerequisites

Before you begin, ensure you have the following tools installed and configured:

1.  **Google Cloud SDK (`gcloud`)**: Make sure the `gcloud` CLI is installed and configured. You will primarily use this for granting permissions and authenticating the data loading script.
2.  **Terraform**: This project uses Terraform to manage infrastructure. Install it from the official Terraform website.
3.  **jq**: A lightweight command-line JSON processor. The data loading script uses it to format the data file. Install it using your system's package manager (e.g., `sudo apt-get install jq` or `brew install jq`).

## Step 1: Set Up Your Service Account

This setup assumes you have a service account that Terraform will use. This service account needs the correct permissions to create BigQuery datasets, tables, and manage IAM policies.

1.  **Create a Service Account**: If you don't already have one, create a service account in the Google Cloud Console (IAM & Admin > Service Accounts).
2.  **Grant Permissions**: Ensure your service account has the following roles:
    *   `roles/bigquery.admin`: Full control over BigQuery resources.
    *   `roles/resourcemanager.projectIamAdmin`:  Allows managing IAM policies on the project.
    *   `roles/serviceusage.serviceUsageConsumer`: Allows using services and APIs in the project.

    You can grant these roles in the IAM section of the Google Cloud Console, or using the `gcloud` CLI:

    ```bash
    gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member="serviceAccount:${TERRAFORM_SA_EMAIL}" --role="roles/bigquery.admin"
    gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member="serviceAccount:${TERRAFORM_SA_EMAIL}" --role="roles/resourcemanager.projectIamAdmin"
    gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member="serviceAccount:${TERRAFORM_SA_EMAIL}" --role="roles/serviceusage.serviceUsageConsumer"
    ```

3.  **Download Key File**: Download the JSON key file for your service account. Keep this file secure, and do not commit it to version control.

## Step 2: Configure Terraform

1.  **Set the `GOOGLE_APPLICATION_CREDENTIALS` Environment Variable:**

    Terraform uses this environment variable to authenticate with Google Cloud using the service account. Set this variable to the path of your service account key file:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account-key.json"
    ```

    Replace `/path/to/your/service-account-key.json` with the actual path to your key file.

2.  **Update `provider.tf`:**

    Ensure your `provider.tf` file (or the `main.tf` file where the provider is defined) does not explicitly define credentials. When `GOOGLE_APPLICATION_CREDENTIALS` is set, the provider will automatically use those credentials.  Remove the `credentials = file("...")` line if it exists.

    ```terraform
    provider "google" {
      project = var.project_id
      region  = var.region
    }
    ```

## Step 3: Deploy BigQuery Resources with Terraform

Now you will use Terraform to create the BigQuery dataset and table as defined in the `.tf` files.

### A. Initialize Terraform

Navigate to the directory containing the Terraform files and run `terraform init`. This command downloads the necessary provider plugins (in this case, for Google Cloud).

```bash
terraform init
```

### B. Plan the Deployment

Run `terraform plan` to see a preview of the resources that Terraform will create. This is a great way to verify that your configuration is correct before making any changes to your cloud environment.

```bash
terraform plan
```

You should see a plan to create:
*   `google_bigquery_dataset.demo_dataset`
*   `google_bigquery_table.demo_table`

### C. Apply the Configuration

If the plan looks correct, apply the changes to create the resources in Google Cloud.

```bash
terraform apply -auto-approve
```

Terraform will create the resources. This may take a minute or two.  The `-auto-approve` flag skips the interactive approval prompt.

## Step 4: Load Data into the BigQuery Table

With the infrastructure in place, the final step is to load data from the local `data.json` file into the `bq_demo_table`. The `load_data_to_bq.sh` script handles this process.

The script will:
1.  Authenticate using the service account key specified in the script.
2.  Convert the `data.json` array into a newline-delimited JSON (NDJSON) format required by BigQuery.
3.  Use the `bq load` command to upload the data and schema into the table.

Before running the script, make sure to replace the following placeholders in the `load_data_to_bq.sh` file:

*   `DATASET_ID`: Replace with your BigQuery dataset ID.
*   `TABLE_NAME`: Replace with your BigQuery table name.
*   `KEY_FILE`:  Make sure this points to the correct path for your service account key file.

Make the script executable and run it:

```bash
chmod +x load_data_to_bq.sh
./load_data_to_bq.sh
```

Upon successful completion, you will see a confirmation message. You can now go to the Google Cloud Console for BigQuery and verify that the `bq_demo_table` contains the data.

## Step 5: Clean Up Resources

When you are finished and no longer need the resources, you can destroy everything that was created by Terraform. This helps avoid incurring unnecessary costs.

Run the following command:

```bash
terraform destroy -auto-approve
```

This will remove the BigQuery dataset, table, and associated IAM bindings created in this process. The `-auto-approve` flag skips the interactive approval prompt.


**Important Considerations:**
*   **Service Account Security:** Treat your service account key file with extreme care.  Do not share it or commit it to version control.
*   **Environment Variables:**  Setting `GOOGLE_APPLICATION_CREDENTIALS` is the recommended way to authenticate when running Terraform with a service account.
*   **Error Handling:**  The scripts provided here include basic error handling (`set -e`).  For production environments, consider more robust error handling and logging.