# Root-level main.tf (this calls the module for reusable network creation)
module "compute_networks" {
  source = "../modules/network"  # Path to the module directory

  for_each = var.networks  # Use for_each to create multiple networks from a map variable

  name                    = each.key  # Network name from map key
  auto_create_subnetworks = each.value.auto_create_subnetworks
  subnetworks             = each.value.subnetworks  # Map of subnetworks to create (if auto_create_subnetworks = false)
  firewalls               = each.value.firewalls    # Map of firewalls to create
}

# Example output to show created network names
output "network_names" {
  value = { for k, v in module.compute_networks : k => v.network_name }
}