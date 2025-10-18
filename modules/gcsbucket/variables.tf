# modules/bucket/variables.tf

variable "buckets" {
  description = "Map of buckets to create with their configurations"
  type = map(object({
    location                    = string
    storage_class               = string
    labels                      = map(string)
    uniform_bucket_level_access = bool
    enable_lifecycle_rule       = bool
    lifecycle_age               = number
    lifecycle_target_storage_class = optional(string, null)
    enable_retention_policy     = bool
    retention_period            = number
    retention_is_locked         = bool
    enable_versioning           = bool
    force_destroy               = bool
  }))
}