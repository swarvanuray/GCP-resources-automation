# Root-level main.tf (this calls the module for reusable bucket creation)


module "storage_buckets" {
  source = "./modules/bucket"  # Path to the module directory

  for_each = var.buckets  # Use for_each to create multiple buckets from a map variable

  name                        = each.key  # Bucket name from map key
  location                    = each.value.location
  storage_class               = each.value.storage_class
  labels                      = each.value.labels
  uniform_bucket_level_access = each.value.uniform_bucket_level_access
  enable_lifecycle_rule       = each.value.enable_lifecycle_rule  # Feature flag for lifecycle rule
  lifecycle_age               = each.value.lifecycle_age
  lifecycle_target_storage_class = each.value.lifecycle_target_storage_class
  enable_retention_policy     = each.value.enable_retention_policy  # Feature flag for retention policy
  retention_period            = each.value.retention_period
  retention_is_locked         = each.value.retention_is_locked
  enable_versioning           = each.value.enable_versioning  # Existing feature flag
  force_destroy               = each.value.force_destroy     # Existing feature flag
}

# Example output to show created bucket names
output "bucket_names" {
  value = { for k, v in module.storage_buckets : k => v.bucket_name }
}