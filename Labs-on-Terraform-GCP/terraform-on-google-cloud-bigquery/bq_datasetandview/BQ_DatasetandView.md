# BigQuery Dataset, Table, and View Deployment Guide

This guide provides a step-by-step walkthrough for deploying a BigQuery dataset, table, and view using Terraform. It also covers how to load initial data into the created table.

The process is divided into three main stages:
1.  **Setup**: Preparing your local environment and creating a dedicated Service Account for Terraform to use.
2.  **Infrastructure Deployment**: Running Terraform to create the Google Cloud resources.
3.  **Data Loading**: Running a script to load data into the newly created BigQuery table.

## Prerequisites

Before you begin, ensure you have the following tools installed and configured:

1.  **Google Cloud SDK (`gcloud`)**: Make sure you can authenticate with your Google Cloud project. Install it from here.
2.  **Terraform**: This project uses Terraform to manage infrastructure. Install it from the official Terraform website.
3.  **jq**: A lightweight command-line JSON processor. The data loading script uses it to format the data file. Install it using your system's package manager (e.g., `sudo apt-get install jq` or `brew install jq`).

## Step 1: Authenticate Your User Account

First, you need to log in to Google Cloud with your personal user account. This account must have sufficient permissions in the project (`myorg-cloudai-gcp1722`) to create service accounts and assign IAM roles.

Run the following command and follow the prompts in your browser:

```bash
gcloud auth login
```

```bash
gcloud auth list
```

Next, set your active project:

```bash
gcloud config set project myorg-cloudai-gcp1722
```

## Step 2: Create a Dedicated Service Account for Terraform

Terraform should run using a dedicated service account to follow the principle of least privilege and for better auditability. The `gcp_iam.sh` script automates the creation of this service account and grants it the necessary permissions.

The script will:
1.  Create a service account named `terraform-bq-usecase`.
2.  Grant it the necessary roles (`bigquery.admin`, `iam.serviceAccountAdmin`, etc.) to manage BigQuery resources and other service accounts.
3.  Create a JSON key file for this service account, which Terraform will use to authenticate.

Make the script executable and run it:

```bash
chmod +x gcp_iam.sh
./gcp_iam.sh
```

After the script completes, a key file named `terraform-bq-usecase-key.json` will be created in the current directory. This key is automatically used by the Terraform configuration and the data loading script.

**Security Note**: This key file contains sensitive credentials. Do not commit it to version control. Ensure it is listed in your `.gitignore` file.

## Step 3: Deploy BigQuery Resources with Terraform

Now you will use Terraform to create the BigQuery dataset, table, and view as defined in the `.tf` files.

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
*   `google_bigquery_table.demo_view`
*   A `google_service_account` and several IAM resources.

### C. Apply the Configuration

If the plan looks correct, apply the changes to create the resources in Google Cloud.

```bash
terraform apply -auto-approve
```

Terraform will ask for confirmation. Type `yes` and press Enter. The resources will be created, which may take a minute or two.

## Step 4: Load Data into the BigQuery Table

With the infrastructure in place, the final step is to load data from the local `data.json` file into the `bq_demo_table`. The `load_data_to_bq.sh` script handles this process.

The script will:
1.  Authenticate using the `terraform-bq-usecase-key.json` service account key.
2.  Convert the `data.json` array into a newline-delimited JSON (NDJSON) format required by BigQuery.
3.  Use the `bq load` command to upload the data and schema into the table.

Make the script executable and run it:

```bash
chmod +x load_data_to_bq.sh
./load_data_to_bq.sh
```

Upon successful completion, you will see a confirmation message. You can now go to the Google Cloud Console for BigQuery and verify that the `bq_demo_table` contains the data and that the `bq_demo_view` is queryable.

## Step 5: Clean Up Resources

When you are finished and no longer need the resources, you can destroy everything that was created by Terraform. This helps avoid incurring unnecessary costs.

Run the following command and confirm by typing `yes`:

```bash
terraform destroy -auto-approve
```

This will remove the BigQuery dataset, table, view, and associated IAM bindings created in this process. Note that it will **not** delete the `terraform-bq-usecase` service account itself, which was created outside of Terraform by the `gcp_iam.sh` script. You can delete it manually from the IAM & Admin section of the Google Cloud Console if desired.
