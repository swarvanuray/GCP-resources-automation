module "pubsub_feature" {
  # The source path tells Terraform where to find the module's code.
  source = "../modules/pubsub"

  # We now pass the project ID separately and group all other settings
  # into a single "configuration" object. This makes the module call cleaner.
  project_id    = var.gcp_project_id
  configuration = var.pubsub_configuration
}