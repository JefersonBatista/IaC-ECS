module "stg" {
  source = "../../infra"

  name = "stg"
  role = "stg"
}

output "IP" {
  value = module.stg.IP
}
