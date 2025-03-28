terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.26.0"
    }
  }
}

provider "google" {
  project = "amiable-might-453515-g6"
  region  = var.location
}
