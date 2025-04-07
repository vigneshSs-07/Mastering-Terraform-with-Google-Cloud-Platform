terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project     = "amiable-might-453515-g6"
  region      = "us-central1"
  zone        = "us-central1-c"
}


