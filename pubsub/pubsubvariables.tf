variable "gcp_project_id" {
  description = "The Google Cloud project ID to deploy resources into."
  type        = string
  # IMPORTANT: You should change this to your actual project ID
  # or provide it when you run terraform apply.
  default     = "focused-bridge-271909"
}

variable "gcp_region" {
  description = "The Google Cloud region for the provider."
  type        = string
  default     = "us-central1"
}

# Grouping all settings for the pubsub feature into a single object
# makes the configuration cleaner and easier to manage.
variable "pubsub_configuration" {
  description = "Configuration settings for the Pub/Sub feature."
  type = object({
    enabled           = bool
    topic_name        = string
    subscription_name = string
  })

  default = {
    enabled           = true
    topic_name        = "feature-flag-topic"
    subscription_name = "feature-flag-subscription"
  }
}