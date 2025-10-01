# PROVIDER CONFIGURATION

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "> 5.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file("/home/cloudaianalytics/terraform/dbt-diabetes-usecase-key.json")
}


