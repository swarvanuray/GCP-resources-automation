# gce/main.tf (root)
# gce/main.tf (root)

module "vm" {
  source = "../modules/vm"
 vms = local.vms
}