resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_name
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.service_account.email
  }

  access {
    role   = "READER"
    domain = "hashicorp.com"
  }
}

resource "google_service_account" "service_account" {
  account_id   = "bqowner-serviceaccount"
  display_name = "Service Account"
}