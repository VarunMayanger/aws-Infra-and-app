resource "aws_ecr_repository" "mrmayanger" {
  name                 = var.app_name
  image_tag_mutability = var.image_mutablity

  image_scanning_configuration {
    scan_on_push = true
  }
}