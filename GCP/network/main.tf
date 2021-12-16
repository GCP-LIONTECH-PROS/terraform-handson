resource "google_compute_network" "dev-liontech" {
  name = "dev-liontech"
  auto_create_subnetworks = true
}

resource "google_compute_network" "wonders-prod" {
  name = "wonders-prod"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name = "sub-sg"
  network = google_compute_network.wonders-prod.id
  ip_cidr_range = "10.1.0.0/24"
  region = "us-central1"
  private_ip_google_access = true

}

resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.wonders-prod.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["49.36.82.10/32"]
  priority = 455
}



output "auto" {
  value = google_compute_network.dev-liontech.id
}

output "custom" {
  value = google_compute_network.wonders-prod.id
}