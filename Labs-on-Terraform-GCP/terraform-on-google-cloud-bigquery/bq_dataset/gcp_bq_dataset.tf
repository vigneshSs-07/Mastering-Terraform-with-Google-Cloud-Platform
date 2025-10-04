resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = "customer_data_${var.environment}"
  friendly_name               = "BigQuery Demo Dataset"
  description                 = "This is a demo dataset for BigQuery"
  location                    = var.region
  default_table_expiration_ms = 3600000
  storage_billing_model       = "PHYSICAL"
  max_time_travel_hours       = 48
  labels = merge(
    {
      environment         = var.environment
      project             = var.project_id
      owner               = var.owner
      cost_center         = var.cost_center
      data_classification = var.data_classification
      # booleans must be converted to strings for labels
      backup_required = tostring(var.backup_required)
      compliance      = var.compliance
      created_by      = var.created_by
      managed_by      = var.managed_by
    },
    var.resource_tags
  )

  access {
    role          = "roles/bigquery.dataOwner"
    user_by_email = google_service_account.bqowner.email
  }

  access {
    role          = "roles/bigquery.dataViewer"
    user_by_email = var.user_by_email
  }

  delete_contents_on_destroy = true

}

resource "google_service_account" "bqowner" {
  account_id   = "bqowner"
  display_name = "Service Account for BigQuery Dataset demo"
}