output "ip" {
  value = google_compute_instance.vm_instance_1.network_interface.0.network_ip
}
