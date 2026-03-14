# modules/bigquery/variables.tf

variable "project_id" {
  description = "The GCP project ID where BigQuery resources will be created."
  type        = string
}

variable "configuration" {
  description = "An object containing all settings for the BigQuery feature."
  type = object({
    enabled     = bool
    dataset_id  = string
    description = optional(string, "")
    location    = optional(string, "US")
    labels      = optional(map(string), {})

    # Expiration settings
    default_table_expiration_ms     = optional(number, null)
    default_partition_expiration_ms = optional(number, null)

    # Feature flags
    enable_delete_contents_on_destroy = optional(bool, false)
    enable_encryption                 = optional(bool, false)
    encryption_key                    = optional(string, null)

    # Access control
    access = optional(list(object({
      role          = string
      special_group = optional(string, null)
      user_by_email = optional(string, null)
      group_by_email = optional(string, null)
    })), [])

    # Tables
    enable_tables = optional(bool, false)
    tables = optional(list(object({
      table_id    = string
      description = optional(string, "")
      schema      = string # JSON schema
      labels      = optional(map(string), {})

      # Partitioning
      enable_time_partitioning = optional(bool, false)
      time_partitioning_type   = optional(string, "DAY")
      time_partitioning_field  = optional(string, null)
      expiration_ms            = optional(number, null)

      enable_range_partitioning   = optional(bool, false)
      range_partitioning_field    = optional(string, null)
      range_partitioning_start    = optional(number, null)
      range_partitioning_end      = optional(number, null)
      range_partitioning_interval = optional(number, null)

      # Clustering
      enable_clustering = optional(bool, false)
      clustering        = optional(list(string), [])

      # Deletion protection
      deletion_protection = optional(bool, false)
    })), [])

    # Views
    enable_views = optional(bool, false)
    views = optional(list(object({
      view_id     = string
      description = optional(string, "")
      query       = string
      labels      = optional(map(string), {})
      use_legacy_sql = optional(bool, false)
    })), [])

    # Routines
    enable_routines = optional(bool, false)
    routines = optional(list(object({
      routine_id      = string
      routine_type    = string # SCALAR_FUNCTION or PROCEDURE
      language        = optional(string, "SQL")
      definition_body = string
      description     = optional(string, "")
      return_type     = optional(string, null)
      arguments = optional(list(object({
        name      = string
        data_type = string
        mode      = optional(string, null)
      })), [])
    })), [])
  })
}
