# The module now accepts the project_id and a single configuration object.

variable "project_id" {
  description = "The GCP project ID where the resources will be created."
  type        = string
}

variable "configuration" {
  description = "An object containing all settings for the Pub/Sub feature."
  type = object({
    enabled           = bool
    topic_name        = string
    subscription_name = string
  })
}

