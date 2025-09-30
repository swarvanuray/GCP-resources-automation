# variables.tf (root)

variable "vm_name" {
  description = "The base name of the VM instance"
  type        = string
  default     = "vm-from-tf"
}

variable "zone" {
  description = "The zone for the VM and disk"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
  default     = "n1-standard-2"
}

variable "network" {
  description = "The VPC network name"
  type        = string
  default     = "custom-vpc-tf"
}

variable "subnetwork" {
  description = "The subnetwork name"
  type        = string
  default     = "sub-sg"
}

variable "image" {
  description = "The boot disk image"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size" {
  description = "The size of the boot disk in GB"
  type        = number
  default     = 35
}

variable "labels" {
  description = "Labels for the VM"
  type        = map(string)
  default     = { "env" = "learning" }
}

variable "preemptible" {
  description = "Whether the VM is preemptible"
  type        = bool
  default     = false
}

variable "automatic_restart" {
  description = "Whether the VM should automatically restart"
  type        = bool
  default     = false
}
variable "scopes" {
  description = "The scopes for the service account"
  type        = list(string)
  default     = ["cloud-platform"]
}

variable "disk_name" {
  description = "The base name of the additional disk"
  type        = string
  default     = "disk-1"
}

variable "disk_size" {
  description = "The size of the additional disk in GB"
  type        = number
  default     = 15
}

variable "disk_type" {
  description = "The type of the additional disk"
  type        = string
  default     = "pd-ssd"
}

variable "vm_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 5
}