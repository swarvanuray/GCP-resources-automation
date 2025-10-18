# gce/locals.tf (root)

locals {
  vms = {
    "vm-from-tf-01" = {
      zone                  = "us-central1-a"
      machine_type          = "n1-standard-2"
      network               = "custom-vpc-tf"
      subnetwork            = "sub-sg"
      image                 = "debian-cloud/debian-12"
      boot_disk_size        = 35
      labels                = { "env" = "learning" }
      preemptible           = false
      automatic_restart     = false
     # service_account_email = "terraform-gcp@terraform-gcp-326702.iam.gserviceaccount.com"
      scopes                = ["cloud-platform"]
      disk_size             = 15
      disk_type             = "pd-ssd"
    }
    "vm-from-tf-02" = {
      zone                  = "us-central1-a"
      machine_type          = "n1-standard-2"
      network               = "custom-vpc-tf"
      subnetwork            = "sub-sg"
      image                 = "debian-cloud/debian-12"
      boot_disk_size        = 35
      labels                = { "env" = "learning" }
      preemptible           = false
      automatic_restart     = false
      #service_account_email = "terraform-gcp@terraform-gcp-326702.iam.gserviceaccount.com"
      scopes                = ["cloud-platform"]
      disk_size             = 15
      disk_type             = "pd-ssd"
    }
    "vm-from-tf-03" = {
      zone                  = "us-central1-a"
      machine_type          = "n1-standard-2"
      network               = "custom-vpc-tf"
      subnetwork            = "sub-sg"
      image                 = "debian-cloud/debian-12"
      boot_disk_size        = 35
      labels                = { "env" = "learning" }
      preemptible           = false
      automatic_restart     = false
      #service_account_email = "terraform-gcp@terraform-gcp-326702.iam.gserviceaccount.com"
      scopes                = ["cloud-platform"]
      disk_size             = 15
      disk_type             = "pd-ssd"
    }
    "vm-from-tf-04" = {
      zone                  = "us-central1-a"
      machine_type          = "n1-standard-2"
      network               = "custom-vpc-tf"
      subnetwork            = "sub-sg"
      image                 = "debian-cloud/debian-12"
      boot_disk_size        = 35
      labels                = { "env" = "learning" }
      preemptible           = false
      automatic_restart     = false
      #service_account_email = "terraform-gcp@terraform-gcp-326702.iam.gserviceaccount.com"
      scopes                = ["cloud-platform"]
      disk_size             = 15
      disk_type             = "pd-ssd"
    }
    "vm-from-tf-05" = {
      zone                  = "us-central1-a"
      machine_type          = "n1-standard-2"
      network               = "custom-vpc-tf"
      subnetwork            = "sub-sg"
      image                 = "debian-cloud/debian-12"
      boot_disk_size        = 35
      labels                = { "env" = "learning" }
      preemptible           = false
      automatic_restart     = false
      #service_account_email = "terraform-gcp@terraform-gcp-326702.iam.gserviceaccount.com"
      scopes                = ["cloud-platform"]
      disk_size             = 15
      disk_type             = "pd-ssd"
    }
    # Add more VMs as needed
  }
}