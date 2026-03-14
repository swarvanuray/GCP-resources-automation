module "bigquery_feature" {
  source = "../modules/bigquery"

  project_id    = var.gcp_project_id
  configuration = var.bigquery_configuration
}
