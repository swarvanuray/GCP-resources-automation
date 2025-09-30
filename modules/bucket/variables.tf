# Module-level variables.tf (in ./modules/bucket/variables.tf) - Inputs for the reusable module
variable "name" {
  description = "Unique name for the GCS bucket"
  type        = string
}

variable "location" {
  description = "Location for the bucket (e.g., US-CENTRAL1)"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Storage class for the bucket (e.g., STANDARD, NEARLINE)"
  type        = string
  default     = "STANDARD"
}

variable "labels" {
  description = "Map of labels to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "uniform_bucket_level_access" {
  description = "Enable uniform bucket-level access"
  type        = bool
  default     = false
}

variable "enable_lifecycle_rule" {
  description = "Feature flag to enable lifecycle rule"
  type        = bool
  default     = false
}

variable "lifecycle_age" {
  description = "Age in days for lifecycle rule condition"
  type        = number
  default     = 0
}

variable "lifecycle_target_storage_class" {
  description = "Target storage class for lifecycle rule action"
  type        = string
  default     = "STANDARD"
}

variable "enable_retention_policy" {
  description = "Feature flag to enable retention policy"
  type        = bool
  default     = false
}

variable "retention_period" {
  description = "Retention period in seconds"
  type        = number
  default     = 0
}

variable "retention_is_locked" {
  description = "Whether the retention policy is locked"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Feature flag to enable object versioning"
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "Feature flag to allow destroying the bucket even if it contains objects"
  type        = bool
  default     = false
}