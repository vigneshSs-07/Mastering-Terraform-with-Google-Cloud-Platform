locals {
  services = [
    "compute.googleapis.com",
    "storage.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}

resource "google_project_service" "enabled_apis" {
  for_each           = toset(local.services)
  service            = each.key
  disable_on_destroy = false
}

# Create a single Compute Engine instance 
resource "google_compute_instance" "vm_instance_1" {
  name         = "vm-instance-1"
  machine_type = "f1-micro"
  tags         = ["web", "caa"] # "dev"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "cloud_ai_analytics"
      }
    }
  }

  # Install Flask
  metadata_startup_script = "echo hi > /test.txt" # echo hi Cloud & AI Analytics

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_1.id

    access_config {
    }
  }

  scheduling {
    preemptible        = true
    automatic_restart  = false
    provisioning_model = "SPOT"
  }
}

resource "google_compute_network" "vm_vpc_network" {
  name                    = "vminstance-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}


resource "google_compute_subnetwork" "subnet_1" {
  name          = "subnetid-1"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vm_vpc_network.id
}



resource "google_compute_firewall" "allow_iap_ssh" {
  name      = "allow-iap-ssh-ingress"
  network   = google_compute_network.vm_vpc_network.id
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["caa"]
}
