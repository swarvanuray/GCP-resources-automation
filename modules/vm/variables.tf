# modules/vm/variables.tf

variable "vms" {
  description = "Map of VMs to create with their configurations"
  type = map(object({
    zone                  = string
    machine_type          = string
    network               = string
    subnetwork            = string
    image                 = string
    boot_disk_size        = number
    labels                = map(string)
    preemptible           = bool
    automatic_restart     = bool
    #service_account_email = string
    scopes                = list(string)
    disk_size             = number
    disk_type             = string
  }))
}