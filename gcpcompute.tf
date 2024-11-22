terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("teste-367618-8e6c45d42a6e.json")

  project = "teste-367618"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

network_interface {
  network = "default"
  access_config {
        //Ephemeral public ip
  }
}

metadata_startup_script = "echo hi > /test.txt"
}
