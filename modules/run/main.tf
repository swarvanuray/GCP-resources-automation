  

resource "google_cloud_run_service" "cloud_run" {
  name     = var.service_name
  location = var.location

  template {
    spec {
      containers {
        image = var.container_image
      }
    }
  }

  dynamic "traffic" {
    for_each = var.traffic
    content {
      revision_name = traffic.value.revision_name
      percent       = traffic.value.percent
    }
  }
}

data "google_iam_policy" "public" {
  count = var.enable_public_access ? 1 : 0

  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "pub_access" {
  count = var.enable_public_access ? 1 : 0

  service     = google_cloud_run_service.cloud_run.name
  location    = google_cloud_run_service.cloud_run.location
  policy_data = data.google_iam_policy.public[0].policy_data
}