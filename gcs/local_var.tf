# local_var.tf (root)

locals {
  buckets = {
    "swarvanu01" = {
      location                    = "US-CENTRAL1"
      storage_class               = "STANDARD"
      labels                      = { "env" = "dev" }
      uniform_bucket_level_access = true
      enable_lifecycle_rule       = true
      lifecycle_age               = 30
      lifecycle_target_storage_class = "NEARLINE"
      enable_retention_policy     = false
      retention_period            = 0
      retention_is_locked         = false
      enable_versioning           = true
      force_destroy               = true
    }

    "swarvanu02" = {
      location                    = "US-CENTRAL1"
      storage_class               = "STANDARD"
      labels                      = { "env" = "prod" }
      uniform_bucket_level_access = true
      enable_lifecycle_rule       = false
      lifecycle_age               = 0
      lifecycle_target_storage_class = null
      enable_retention_policy     = true
      retention_period            = 86400  # 1 day in seconds
      retention_is_locked         = false
      enable_versioning           = false
      force_destroy               = false
    }

    # Add more buckets as needed with their specific configurations
  }
}