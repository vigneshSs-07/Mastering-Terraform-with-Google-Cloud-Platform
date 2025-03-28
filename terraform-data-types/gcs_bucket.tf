resource "google_storage_bucket" "auto-expire" {
  name          = var.gcs_bucket_name
  storage_class = "Standard"
  location      = var.location
  force_destroy = true
}