resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = "bq_demo_dataset"
  friendly_name               = "BigQuery Demo Dataset"
  description                 = "This is a demo dataset for BigQuery"
  location                    = var.region
  default_table_expiration_ms = 3600000
  storage_billing_model       = "PHYSICAL"
  max_time_travel_hours       = 48
  labels = {
    env                 = "dev"
    environment         = "development"
    project             = "myorg-cloudai-gcp1722"
    owner               = "data-engineering-team"
    cost_center         = "analytics"
    data_classification = "internal"
    backup_required     = "true"
    compliance          = "gdpr-compliant"
    created_by          = "terraform"
    managed_by          = "infrastructure-team"
    business_unit       = "data-analytics"
    application         = "data-warehouse"
    purpose             = "demo-testing"
  }

  access {
    role          = "roles/bigquery.dataOwner"
    user_by_email = google_service_account.bqowner.email
  }

  delete_contents_on_destroy = true

}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}