# main.tf (root)

module "cloud_run" {
  source = "../modules/run"

  service_name    = var.service_name
  location        = var.location
  container_image = var.container_image
  traffic         = var.traffic
  enable_public_access = var.enable_public_access
}