# main.tf (root)

module "storage_buckets" {
  source = "../modules/gcsbucket"

  buckets = local.buckets
}