terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
  backend "remote" {
		hostname = "app.terraform.io"
		organization = "mrmayanger"

		workspaces {
			name = "aws_infra_app"
		}
	}
  required_version = ">= 1.1.0"
}

provider "aws"{
  region = "us-west-2"
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}

# ec2 module

module "ec2" {
    source = "../../../modules/ec2"
    name =   "dev_ssm_role"
    pub_subnet = module.subnet.pub_subnet_id  
    iam_instace_profile = module.iam.iam_instance_profile
    grp_ids = module.security_group.grp_ids 
}

# ecr module

module "ecr"{
    source = "../../../modules/ecr"
    app_name =    "python_app"
    image_mutablity =  "MUTABLE"
}

# gateway - internet and network 

module "gateway"{
    source = "../../../modules/gateway"
    vpc_id = module.vpc.vpc_id
    pvt_subnet_id = module.subnet.pvt_subnet_id
}

# RDS

module "rds"{
    source = "../../../modules/rds"
}

# Route Table module

module "route_table"{
    source = "../../../modules/route_table"
    vpc_id = module.vpc.vpc_id
    private_subnet = module.subnet.pvt_subnet_id
    public_subnet   = module.subnet.pub_subnet_id
    ig_id = module.gateway.ig_id
    ng_id = module.gateway.ng_id
}

# S3 Bucket module

module "s3_bucket"{
    source = "../../../modules/s3_bucket"
}

# VPC module

module "vpc"{
    source = "../../../modules/vpc"
}

module "subnet"{
    source = "../../../modules/subnet"
    vpc_id =  module.vpc.vpc_id

}

module "security_group"{
source = "../../../modules/security_group"
vpc_id = module.vpc.vpc_id
}

module "iam"{
source = "../../../modules/iam"
}