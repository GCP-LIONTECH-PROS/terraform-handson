resource "google_compute_instance" "wonders-prod-vm" {
  name = "wonders-prod-vm"
  zone = "us-central1-a"
  machine_type = "n1-standard-2"

  allow_stopping_for_update = true

  network_interface {
    network = "wonders-prod"
    subnetwork = "sub-sg"
  }

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20210916"
      size = 35
      
    }
    auto_delete = false
  }

  labels = {
    "env" = "prod"
  }

  
  scheduling {
    preemptible = false
    automatic_restart = false
  }
  
  service_account {
    email = "liontech-pros-dev@wonders-tech.iam.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 100
  zone = "asia-southeast1-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "disk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.wonders-prod-vm.id
}


