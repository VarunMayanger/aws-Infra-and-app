resource "aws_ecr_repository" "mrmayanger" {
  name                 = var.app_name
  image_tag_mutability = var.image_mutablity

  image_scanning_configuration {
    scan_on_push = true
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

}


