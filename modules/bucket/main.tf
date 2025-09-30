# Module-level main.tf (in ./modules/bucket/main.tf) - Reusable script for a single bucket
resource "google_storage_bucket" "this" {
  name                        = var.name
  location                    = var.location
  storage_class               = var.storage_class
  labels                      = var.labels
  uniform_bucket_level_access = var.uniform_bucket_level_access
  force_destroy               = var.force_destroy

  versioning {
    enabled = var.enable_versioning  # Uses the feature flag to enable/disable versioning
  }

  dynamic "lifecycle_rule" {
    for_each = var.enable_lifecycle_rule ? [1] : []  # Conditionally include based on feature flag
    content {
      condition {
        age = var.lifecycle_age
      }
      action {
        type          = "SetStorageClass"
        storage_class = var.lifecycle_target_storage_class
      }
    }
  }

  dynamic "retention_policy" {
    for_each = var.enable_retention_policy ? [1] : []  # Conditionally include based on feature flag
    content {
      is_locked        = var.retention_is_locked
      retention_period = var.retention_period
    }
  }

  # Add more features as needed, e.g., other lifecycle rules, etc.
}

# Output the bucket name for reference in root
output "bucket_name" {
  value = google_storage_bucket.this.name
}