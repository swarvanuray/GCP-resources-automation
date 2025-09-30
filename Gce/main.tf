# main.tf (root)

module "vm" {
  source = "../modules/vm"  # Path to the VM module

  vm_name               = var.vm_name
  zone                  = var.zone
  machine_type          = var.machine_type
  network               = var.network
  subnetwork            = var.subnetwork
  image                 = var.image
  boot_disk_size        = var.boot_disk_size
  labels                = var.labels
  preemptible           = var.preemptible
  automatic_restart     = var.automatic_restart
  scopes                = var.scopes
  disk_name             = var.disk_name
  disk_size             = var.disk_size
  disk_type             = var.disk_type
  vm_count              = var.vm_count
}

# If integrating with previous modules, you could reference outputs like:
# network    = module.network.vpc_name
# subnetwork = module.network.subnet_name