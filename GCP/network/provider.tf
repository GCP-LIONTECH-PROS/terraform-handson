terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.85.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "wonders-tech"
  region = "northamerica-northeast2"
  zone = "northamerica-northeast2-a"
  credentials = "keys.json"
}











