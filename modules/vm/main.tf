# modules/vm/main.tf

resource "google_compute_instance" "vm" {
  count                     = var.vm_count
  name                      = "${var.vm_name}-${format("%02d", count.index + 1)}"
  zone                      = var.zone
  machine_type              = var.machine_type
  allow_stopping_for_update = true

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size
    }
    auto_delete = false
  }

  labels = var.labels

  scheduling {
    preemptible       = var.preemptible
    automatic_restart = var.automatic_restart
  }
    lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }
}

resource "google_compute_disk" "disk" {
  count = var.vm_count
  name  = "${var.disk_name}-${format("%02d", count.index + 1)}"
  size  = var.disk_size
  zone  = var.zone
  type  = var.disk_type
}

resource "google_compute_attached_disk" "attached_disk" {
  count    = var.vm_count
  disk     = google_compute_disk.disk[count.index].id
  instance = google_compute_instance.vm[count.index].id
}