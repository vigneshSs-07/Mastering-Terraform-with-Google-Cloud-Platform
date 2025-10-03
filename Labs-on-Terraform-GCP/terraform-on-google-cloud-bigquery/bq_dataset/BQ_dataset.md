>>> **MASTERING TERRAFORM WITH GOOGLE CLOUD PLATFORM**
------------------------

> TITLE: "**BigQuery Dataset Deployment Guide (User Account)**"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, DataEngineer, Terraform, BigQuery, SQL, IAC]

-----------------------------------------------------------------------------------------------------------------------


This guide provides a step-by-step walkthrough for deploying a BigQuery dataset using Terraform.

This workflow uses an authenticated user account to run Terraform. The Terraform configuration will then create a BigQuery dataset and a dedicated service account (`bqowner`) which is granted `dataOwner` permissions on that dataset.

The process is divided into three main stages:
1.  **Setup**: Preparing your local environment and authenticating your user account.
2.  **Infrastructure Deployment**: Running Terraform to create the Google Cloud resources.
3.  **Cleanup**: Destroying the created resources.

## Prerequisites

Before you begin, ensure you have the following tools installed and configured:

1.  **Google Cloud SDK (`gcloud`)**: Make sure you can authenticate with your Google Cloud project. Installation Guide.
2.  **Terraform**: This project uses Terraform to manage infrastructure. Installation Guide.

## Step 1: Authenticate Your User Account

First, you need to log in to Google Cloud with your personal user account. This account must have sufficient permissions in the project (`myorg-cloudai-gcp1722`) to create BigQuery datasets, service accounts, and assign IAM roles. The `roles/editor` or `roles/owner` predefined roles are sufficient.

Run the following command and follow the prompts in your browser:

```bash
gcloud auth login
```

Next, set your active project:

```bash
gcloud config set project myorg-cloudai-gcp1722
```

## Step 2: Deploy the BigQuery Dataset with Terraform

Now you will use Terraform to create the BigQuery dataset as defined in your `.tf` files. The Terraform provider should be configured to use the key file generated in the previous step.

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

### C. Apply the Configuration

If the plan looks correct, apply the changes to create the resources in Google Cloud.

```bash
terraform apply -auto-approve
```

Terraform will create the dataset, which should only take a moment. The `-auto-approve` flag skips the interactive confirmation prompt.

You can now go to the Google Cloud Console for BigQuery and verify that the `bq_demo_dataset_1` dataset has been created.

## Step 4: Clean Up Resources

When you are finished and no longer need the resources, you can destroy everything that was created by Terraform. This helps avoid incurring unnecessary costs.

Run the following command:

```bash
terraform destroy -auto-approve
```

This will remove the BigQuery dataset created by Terraform.


-----------------------------------------------------------------------------------------------------------------------


  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>
