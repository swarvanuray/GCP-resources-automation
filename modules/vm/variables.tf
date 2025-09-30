# modules/vm/variables.tf

variable "vm_name" {
  description = "The base name of the VM instance"
  type        = string
}

variable "zone" {
  description = "The zone for the VM and disk"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
}

variable "network" {
  description = "The VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork name"
  type        = string
}

variable "image" {
  description = "The boot disk image"
  type        = string
}

variable "boot_disk_size" {
  description = "The size of the boot disk in GB"
  type        = number
}

variable "labels" {
  description = "Labels for the VM"
  type        = map(string)
}

variable "preemptible" {
  description = "Whether the VM is preemptible"
  type        = bool
}

variable "automatic_restart" {
  description = "Whether the VM should automatically restart"
  type        = bool
}

variable "scopes" {
  description = "The scopes for the service account"
  type        = list(string)
}

variable "disk_name" {
  description = "The base name of the additional disk"
  type        = string
}

variable "disk_size" {
  description = "The size of the additional disk in GB"
  type        = number
}

variable "disk_type" {
  description = "The type of the additional disk"
  type        = string
}

variable "vm_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 1
}