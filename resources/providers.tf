terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "tf-state-bucket420"
    prefix = "terraform/state/resources"
  }
}

provider "google" {
  project = "focused-bridge-271909"
  region  = "us-central1"
}
