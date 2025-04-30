terraform {
  backend "s3" {
    bucket = "jeferson-ecs-terraform-state"
    key = "stg/terraform.tfstate"
    region = "us-east-2"
  }
}
