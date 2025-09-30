# Module-level main.tf (in ./modules/network/main.tf) - Reusable script for a single network with optional subnetworks and firewalls
resource "google_compute_network" "this" {
  name                    = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "this" {
  for_each = var.subnetworks

  name                     = each.key
  network                  = google_compute_network.this.id
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  private_ip_google_access = each.value.private_ip_google_access  # Uses the feature flag
}

resource "google_compute_firewall" "this" {
  for_each = var.firewalls

  name    = each.key
  network = google_compute_network.this.id

  priority      = each.value.priority
  source_ranges = each.value.source_ranges

  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
    }
  }
}

# Output the network name for reference in root
output "network_name" {
  value = google_compute_network.this.name
}