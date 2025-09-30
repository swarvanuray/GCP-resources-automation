# Module-level variables.tf (in ./modules/network/variables.tf) - Inputs for the reusable module
variable "name" {
  description = "Name for the compute network"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Feature flag to auto-create subnetworks"
  type        = bool
  default     = false
}

variable "subnetworks" {
  description = "Map of subnetworks to create (if auto_create_subnetworks = false)"
  type = map(object({
    ip_cidr_range            = string
    region                   = string
    private_ip_google_access = bool
  }))
  default = {}
}

variable "firewalls" {
  description = "Map of firewalls to create for the network"
  type = map(object({
    priority      = number
    source_ranges = list(string)
    allow         = list(object({
      protocol = string
    }))
  }))
  default = {}
}