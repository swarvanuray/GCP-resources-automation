# modules/vm/main.tf

resource "google_compute_instance" "vm" {
  for_each                  = var.vms
  name                      = each.key
  zone                      = each.value.zone
  machine_type              = each.value.machine_type
  allow_stopping_for_update = true

  network_interface {
    network    = each.value.network
    subnetwork = each.value.subnetwork
  }

  boot_disk {
    initialize_params {
      image = each.value.image
      size  = each.value.boot_disk_size
    }
    auto_delete = false
  }

  labels = each.value.labels

  scheduling {
    preemptible       = each.value.preemptible
    automatic_restart = each.value.automatic_restart
  }

 # service_account {
   # email  = each.value.service_account_email
    #scopes = each.value.scopes
  #}

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }
}

resource "google_compute_disk" "disk" {
  for_each = var.vms
  name     = "${each.key}-disk"
  size     = each.value.disk_size
  zone     = each.value.zone
  type     = each.value.disk_type
}

resource "google_compute_attached_disk" "attached_disk" {
  for_each = var.vms
  disk     = google_compute_disk.disk[each.key].id
  instance = google_compute_instance.vm[each.key].id
}