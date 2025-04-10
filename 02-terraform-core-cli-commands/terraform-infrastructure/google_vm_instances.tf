resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      #image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}




# Create a single Compute Engine instance
resource "google_compute_instance" "flask_app_1" {
  name         = "flask-vm"
  machine_type = "f1-micro"
  zone         = "us-west1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python3-pip rsync; pip install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_1.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }

  scheduling {
    preemptible = true
    automatic_restart = false
    provisioning_model = "SPOT"
  }
}

resource "google_compute_network" "main_vpc" {
  name                    = "main-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = "subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west1-a"
  network       = google_compute_network.main_vpc.id
}
