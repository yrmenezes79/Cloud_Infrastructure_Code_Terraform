provider "google" {
  credentials = file("XXXXXXX")

  project = "XXXXX"
  region  = "us-central1"
  zone    = "us-central1-c"
}
