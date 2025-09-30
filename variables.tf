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

variable "buckets" {
  description = "Map of buckets to create, with configurations"
  type = map(object({
    location                       = string
    storage_class                  = string
    labels                         = map(string)
    uniform_bucket_level_access    = bool
    enable_lifecycle_rule          = bool  # Feature flag for enabling lifecycle rule
    lifecycle_age                  = number
    lifecycle_target_storage_class = string
    enable_retention_policy        = bool  # Feature flag for enabling retention policy
    retention_period               = number
    retention_is_locked            = bool
    enable_versioning              = bool  # Feature flag for enabling object versioning
    force_destroy                  = bool  # Feature flag for allowing bucket destruction even if not empty
  }))
  default = {
    "swarvanubucket123456" = {
      location                       = "US-CENTRAL1"
      storage_class                  = "NEARLINE"
      labels                         = {
        "env" = "tf_env"
        "dep" = "compliance"
      }
      uniform_bucket_level_access    = true
      enable_lifecycle_rule          = true
      lifecycle_age                  = 5
      lifecycle_target_storage_class = "COLDLINE"
      enable_retention_policy        = true
      retention_period               = 864000
      retention_is_locked            = true
      enable_versioning              = false
      force_destroy                  = false
    }
    "swarvanubucket12345678" = {
      location                       = "US-CENTRAL1"
      storage_class                  = "STANDARD"
      labels                         = {
        "env" = "tf_env"
        "dep" = "compliance"
      }
      uniform_bucket_level_access    = true
      enable_lifecycle_rule          = true
      lifecycle_age                  = 5
      lifecycle_target_storage_class = "COLDLINE"
      enable_retention_policy        = true
      retention_period               = 864000
      retention_is_locked            = true
      enable_versioning              = false
      force_destroy                  = false
    }
  }
}