### INITIAL CODES

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {

  project = "encoded-alpha-446711-h0"
  region  = "us-east4"
  zone    = "us-east4-a"
}

resource "google_compute_instance" "terraform" {
  name         = "demo-instance-tf"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "caa"
      }
    }
  }


  network_interface {
    network = "default"
    access_config {
    }
  }
}



### AFTER CHANGE
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {

  project = "encoded-alpha-446711-h0"
  region  = "us-east4"
  zone    = "us-east4-a"
}

resource "google_compute_instance" "terraform" {
  name         = "demo-instance-tf"
  machine_type = "e2-medium"
  tags         = ["web", "gcp"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "caa"
      }
    }
  }


  network_interface {
    network = "default"
    access_config {
    }
  }
  allow_stopping_for_update = true
}
