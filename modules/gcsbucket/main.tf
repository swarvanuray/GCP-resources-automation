# modules/bucket/main.tf

resource "google_storage_bucket" "bucket" {
  for_each = var.buckets

  name                        = each.key
  location                    = each.value.location
  storage_class               = each.value.storage_class
  labels                      = each.value.labels
  uniform_bucket_level_access = each.value.uniform_bucket_level_access
  force_destroy               = each.value.force_destroy

  dynamic "lifecycle_rule" {
    for_each = each.value.enable_lifecycle_rule ? [1] : []
    content {
      action {
        type          = "SetStorageClass"
        storage_class = each.value.lifecycle_target_storage_class
      }
      condition {
        age = each.value.lifecycle_age
      }
    }
  }

  dynamic "retention_policy" {
    for_each = each.value.enable_retention_policy ? [1] : []
    content {
      retention_period = each.value.retention_period
      is_locked        = each.value.retention_is_locked
    }
  }

  dynamic "versioning" {
    for_each = each.value.enable_versioning ? [1] : []
    content {
      enabled = true
    }
  }
}

output "bucket_names" {
  value = { for k, v in google_storage_bucket.bucket : k => v.name }
}