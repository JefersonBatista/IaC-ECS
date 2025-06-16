resource "aws_ecr_repository" "repository" {
  name         = var.name
  force_delete = true
}
