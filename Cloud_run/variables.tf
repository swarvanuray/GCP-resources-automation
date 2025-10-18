# variables.tf (root)

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "run-app-from-tf"
}

variable "location" {
  description = "The location for the Cloud Run service"
  type        = string
  default     = "us-central1"
}

variable "container_image" {
  description = "The container image for the Cloud Run service"
  type        = string
  default     = "gcr.io/google-samples/hello-app:2.0"
}

variable "traffic" {
  description = "List of traffic allocations"
  type = list(object({
    revision_name = string
    percent       = number
  }))
  default = [
    {
      revision_name = "run-app-from-tf-vqn2c"
      percent       = 100
    }
  ]
}

variable "enable_public_access" {
  description = "Whether to enable public access to the service"
  type        = bool
  default     = true
}