# ================================================================================
# TERRAFORM VARIABLE VALUES
#
# This file contains the values for the variables defined in variables.tf.
# You can create different .tfvars files for different environments
# (e.g., dev.tfvars, prod.tfvars) and apply them using:
# terraform apply -var-file="your-vars-file.tfvars"
# ================================================================================

project_id        = "myorg-cloudai-gcp1722"
region            = "europe-west1"
zone              = "europe-west1-b"
environment       = "dev"
owner             = "data-engineering-team"
user_by_email     = "cloudaianalytics@gmail.com"
sec_user_by_email = "kf.dataengineer@gmail.com"

dataset_id = "bq_demo_dataset_1"
table_id   = "bq_demo_table_1"

partioning_keys       = "created_at"
table_clustering_keys = ["user_id", "is_active", "age"]