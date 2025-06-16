module "stg" {
  source = "../../infra"

  name         = "stg"
  role         = "stg"
  cluster_name = "stg-cluster"
}

output "IP" {
  value = module.stg.IP
}
