# Root-level variables.tf (optional, but recommended for defining inputs)
variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "networks" {
  description = "Map of networks to create, with configurations"
  type = map(object({
    auto_create_subnetworks = bool
    subnetworks = map(object({
      ip_cidr_range            = string
      region                   = string
      private_ip_google_access = bool  # Feature flag for enabling private Google access
    }))
    firewalls = map(object({
      priority      = number
      source_ranges = list(string)
      allow         = list(object({
        protocol = string
      }))
    }))
  }))
  default = {
    "auto-vpc-tf" = {
      auto_create_subnetworks = true
      subnetworks             = {}
      firewalls               = {}
    }
    "custom-vpc-tf" = {
      auto_create_subnetworks = false
      subnetworks = {
        "sub-sg" = {
          ip_cidr_range            = "10.1.0.0/24"
          region                   = "us-central1"
          private_ip_google_access = true
        }
      }
      firewalls = {
        "allow-icmp" = {
          priority      = 455
          source_ranges = ["152.58.183.254/32"]
          allow = [
            {
              protocol = "icmp"
            }
          ]
        }
      }
    }
  }
}