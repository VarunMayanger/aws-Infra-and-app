
# Code for EC2 linux instance

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

}

resource "aws_instance" "web" {
  ami           = "ami-0fa167c2af1ea0840"
  instance_type = "t3.micro"

  subnet_id                   = var.pub_subnet
  vpc_security_group_ids      = [var.grp_ids]
  associate_public_ip_address = true

  user_data            = data.template_file.startup.rendered
  iam_instance_profile = var.iam_instace_profile
}

data "template_file" "startup" {
  template = file("../../boot.sh")
}

