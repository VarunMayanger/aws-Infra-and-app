resource "aws_iam_role" "dev-resources-iam-role" {
name        = "dev_ssm_role"
description = "The role for the developer resources EC2"
assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": {
"Effect": "Allow",
"Principal": {"Service": "ec2.amazonaws.com"},
"Action": "sts:AssumeRole"
}
}

EOF
}



resource "aws_iam_instance_profile" "dev_iam_profile" {
  name = "dev_iam_profile"
  role = aws_iam_role.dev-resources-iam-role.name
}

data "template_file" "startup" {
 template = file("boot.sh")
}



resource "aws_iam_policy" "ecr_policy" {
  name        = "ecr_policy_new"
  path        = "/"
  description = "My ECR policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage",
                "ecr:GetLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:ListTagsForResource",
                "ecr:DescribeImageScanFindings",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:PutImage"
            ],
            "Resource": "*"
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dev-resources-ecr-policy" {
role       = aws_iam_role.dev-resources-iam-role.name
policy_arn = aws_iam_policy.ecr_policy.arn
}
resource "aws_iam_role_policy_attachment" "dev-resources-ssm-policy" {
role       = aws_iam_role.dev-resources-iam-role.name
policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}




# Code for EC2 linux instance

data "aws_ami" "amazon_linux" {
  most_recent = true
    owners = ["099720109477"] # Canonical
  
}

resource "aws_instance" "web" {
  ami = "ami-0fa167c2af1ea0840"
  instance_type = "t3.micro"  
  
  subnet_id                   = aws_subnet.pubsubnet1.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  
  user_data = data.template_file.startup.rendered
  iam_instance_profile = aws_iam_instance_profile.dev_iam_profile.name
}
