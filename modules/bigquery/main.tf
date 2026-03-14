# modules/bigquery/main.tf

locals {
  tables   = { for t in var.configuration.tables : t.table_id => t }
  views    = { for v in var.configuration.views : v.view_id => v }
  routines = { for r in var.configuration.routines : r.routine_id => r }
}

# --- Dataset ---
resource "google_bigquery_dataset" "main" {
  count = var.configuration.enabled ? 1 : 0

  project                        = var.project_id
  dataset_id                     = var.configuration.dataset_id
  friendly_name                  = var.configuration.dataset_id
  description                    = var.configuration.description
  location                       = var.configuration.location
  labels                         = var.configuration.labels
  default_table_expiration_ms    = var.configuration.default_table_expiration_ms
  default_partition_expiration_ms = var.configuration.default_partition_expiration_ms
  delete_contents_on_destroy     = var.configuration.enable_delete_contents_on_destroy

  dynamic "default_encryption_configuration" {
    for_each = var.configuration.enable_encryption ? [1] : []
    content {
      kms_key_name = var.configuration.encryption_key
    }
  }

  dynamic "access" {
    for_each = var.configuration.access
    content {
      role           = access.value.role
      special_group  = access.value.special_group
      user_by_email  = access.value.user_by_email
      group_by_email = access.value.group_by_email
    }
  }
}

# --- Tables ---
resource "google_bigquery_table" "main" {
  for_each = var.configuration.enabled && var.configuration.enable_tables ? local.tables : {}

  project             = var.project_id
  dataset_id          = google_bigquery_dataset.main[0].dataset_id
  table_id            = each.key
  description         = each.value.description
  schema              = each.value.schema
  labels              = each.value.labels
  deletion_protection = each.value.deletion_protection

  dynamic "time_partitioning" {
    for_each = each.value.enable_time_partitioning ? [1] : []
    content {
      type          = each.value.time_partitioning_type
      field         = each.value.time_partitioning_field
      expiration_ms = each.value.expiration_ms
    }
  }

  dynamic "range_partitioning" {
    for_each = each.value.enable_range_partitioning ? [1] : []
    content {
      field = each.value.range_partitioning_field
      range {
        start    = each.value.range_partitioning_start
        end      = each.value.range_partitioning_end
        interval = each.value.range_partitioning_interval
      }
    }
  }

  clustering = each.value.enable_clustering ? each.value.clustering : null

  depends_on = [google_bigquery_dataset.main]
}

# --- Views ---
resource "google_bigquery_table" "views" {
  for_each = var.configuration.enabled && var.configuration.enable_views ? local.views : {}

  project             = var.project_id
  dataset_id          = google_bigquery_dataset.main[0].dataset_id
  table_id            = each.key
  description         = each.value.description
  labels              = each.value.labels
  deletion_protection = false

  view {
    query          = each.value.query
    use_legacy_sql = each.value.use_legacy_sql
  }

  depends_on = [google_bigquery_dataset.main]
}

# --- Routines ---
resource "google_bigquery_routine" "main" {
  for_each = var.configuration.enabled && var.configuration.enable_routines ? local.routines : {}

  project         = var.project_id
  dataset_id      = google_bigquery_dataset.main[0].dataset_id
  routine_id      = each.key
  routine_type    = each.value.routine_type
  language        = each.value.language
  definition_body = each.value.definition_body
  description     = each.value.description
  return_type     = each.value.return_type

  dynamic "arguments" {
    for_each = each.value.arguments
    content {
      name      = arguments.value.name
      data_type = arguments.value.data_type
      mode      = arguments.value.mode
    }
  }

  depends_on = [google_bigquery_dataset.main]
}
