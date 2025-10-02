# modules/cloud_run/variables.tf

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "location" {
  description = "The location for the Cloud Run service"
  type        = string
}

variable "container_image" {
  description = "The container image for the Cloud Run service"
  type        = string
}

variable "traffic" {
  description = "List of traffic allocations"
  type = list(object({
    revision_name = string
    percent       = number
  }))
  default = []
}

variable "enable_public_access" {
  description = "Whether to enable public access to the service"
  type        = bool
  default     = true
}