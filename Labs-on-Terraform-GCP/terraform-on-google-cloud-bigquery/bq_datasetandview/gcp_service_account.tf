# -------------------------------
# Service Account for BigQuery
# -------------------------------
resource "google_service_account" "bqowner" {
  account_id   = "bq-terraform-owner"
  display_name = "BigQuery Owner Service Account"
}

# Grant BigQuery Admin role to the service account at project level
resource "google_project_iam_member" "bq_admin" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  = "serviceAccount:${google_service_account.bqowner.email}"
}


resource "google_project_iam_member" "user_role" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  = "user:${var.user_by_email}"
}