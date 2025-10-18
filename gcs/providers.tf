# providers.tf (or backend.tf)

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"  # Adjust to your version
    }
  }

  backend "gcs" {
    bucket  = "tf-state-bucket420"  # Replace with your bucket name
    prefix  = "terraform/state"       # Optional: Path within bucket for organization (e.g., per environment)
    # credentials = "/path/to/your/service-account-key.json"  # Optional: If not using ADC
  }
}

provider "google" {
  project = "focused-bridge-271909"  # Replace with your GCP project ID
  region  = "us-central1"  # Replace with your default region
  # credentials = "/path/to/your/service-account-key.json"  # Optional
}