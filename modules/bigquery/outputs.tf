# modules/bigquery/outputs.tf

output "dataset" {
  description = "The BigQuery dataset resource."
  value       = var.configuration.enabled ? google_bigquery_dataset.main[0] : null
}

output "dataset_id" {
  description = "The ID of the BigQuery dataset."
  value       = var.configuration.enabled ? google_bigquery_dataset.main[0].dataset_id : null
}

output "tables" {
  description = "Map of BigQuery table resources."
  value       = google_bigquery_table.main
}

output "table_ids" {
  description = "List of BigQuery table IDs."
  value       = [for t in google_bigquery_table.main : t.table_id]
}

output "views" {
  description = "Map of BigQuery view resources."
  value       = google_bigquery_table.views
}

output "view_ids" {
  description = "List of BigQuery view IDs."
  value       = [for v in google_bigquery_table.views : v.table_id]
}

output "routines" {
  description = "Map of BigQuery routine resources."
  value       = google_bigquery_routine.main
}

output "routine_ids" {
  description = "List of BigQuery routine IDs."
  value       = [for r in google_bigquery_routine.main : r.routine_id]
}
