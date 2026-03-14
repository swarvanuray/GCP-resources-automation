variable "gcp_project_id" {
  description = "The Google Cloud project ID to deploy resources into."
  type        = string
  default     = "focused-bridge-271909"
}

variable "bigquery_configuration" {
  description = "Configuration settings for the BigQuery feature."
  type = object({
    enabled     = bool
    dataset_id  = string
    description = optional(string, "")
    location    = optional(string, "US")
    labels      = optional(map(string), {})

    default_table_expiration_ms     = optional(number, null)
    default_partition_expiration_ms = optional(number, null)

    enable_delete_contents_on_destroy = optional(bool, false)
    enable_encryption                 = optional(bool, false)
    encryption_key                    = optional(string, null)

    access = optional(list(object({
      role           = string
      special_group  = optional(string, null)
      user_by_email  = optional(string, null)
      group_by_email = optional(string, null)
    })), [])

    enable_tables = optional(bool, false)
    tables = optional(list(object({
      table_id    = string
      description = optional(string, "")
      schema      = string
      labels      = optional(map(string), {})

      enable_time_partitioning = optional(bool, false)
      time_partitioning_type   = optional(string, "DAY")
      time_partitioning_field  = optional(string, null)
      expiration_ms            = optional(number, null)

      enable_range_partitioning   = optional(bool, false)
      range_partitioning_field    = optional(string, null)
      range_partitioning_start    = optional(number, null)
      range_partitioning_end      = optional(number, null)
      range_partitioning_interval = optional(number, null)

      enable_clustering = optional(bool, false)
      clustering        = optional(list(string), [])

      deletion_protection = optional(bool, false)
    })), [])

    enable_views = optional(bool, false)
    views = optional(list(object({
      view_id        = string
      description    = optional(string, "")
      query          = string
      labels         = optional(map(string), {})
      use_legacy_sql = optional(bool, false)
    })), [])

    enable_routines = optional(bool, false)
    routines = optional(list(object({
      routine_id      = string
      routine_type    = string
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

  default = {
    enabled                           = true
    dataset_id                        = "feature_flag_dataset"
    description                       = "BigQuery dataset managed by Terraform"
    location                          = "US"
    labels                            = { env = "dev", managed_by = "terraform" }
    enable_delete_contents_on_destroy = true

    enable_tables = true
    tables = [
      {
        table_id    = "example_table"
        description = "An example table"
        schema      = <<-EOT
          [
            {"name": "id", "type": "INT64", "mode": "REQUIRED", "description": "Unique ID"},
            {"name": "name", "type": "STRING", "mode": "NULLABLE", "description": "Name"},
            {"name": "created_at", "type": "TIMESTAMP", "mode": "NULLABLE", "description": "Creation timestamp"}
          ]
        EOT

        enable_time_partitioning = true
        time_partitioning_type   = "DAY"
        time_partitioning_field  = "created_at"

        enable_clustering = true
        clustering        = ["name"]

        deletion_protection = false
      }
    ]
  }
}
