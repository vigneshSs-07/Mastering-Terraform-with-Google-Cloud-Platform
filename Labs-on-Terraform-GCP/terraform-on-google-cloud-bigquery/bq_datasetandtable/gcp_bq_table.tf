resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id            = "bq_demo_dataset_1"
  friendly_name         = "BigQuery Demo Dataset"
  description           = "This is a demo dataset for BigQuery"
  location              = var.region
  storage_billing_model = "PHYSICAL"
  max_time_travel_hours = 48
  labels = {
    environment = var.environment
    owner       = var.owner
    created_by  = "terraform"
  }

  access {
    role          = "roles/bigquery.dataOwner"
    user_by_email = google_service_account.bqowner.email 
  }

  delete_contents_on_destroy = true

}

# Grant the service account running terraform permissions on the dataset
resource "google_bigquery_dataset_iam_member" "terraform_sa_dataset_owner" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.demo_dataset.dataset_id
  role       = "roles/bigquery.dataOwner"
  member     = "user:${var.sec_user_by_email}"
}


resource "google_bigquery_table" "demo_table" {
  dataset_id    = google_bigquery_dataset.demo_dataset.dataset_id
  table_id      = "bq_demo_table"
  friendly_name = "BigQuery Demo Table"
  description   = "Demo table for BigQuery"
  expiration_time = null 

  time_partitioning {
    type  = "DAY"
    field = "created_at"
  }

  clustering = ["user_id", "is_active", "age"]

  labels = {
    environment = var.environment
  }

  schema = file("schema/schema.json")

  deletion_protection = false

  depends_on = [
    google_bigquery_dataset_iam_member.terraform_sa_dataset_owner,
    google_bigquery_dataset.demo_dataset
  ]
}