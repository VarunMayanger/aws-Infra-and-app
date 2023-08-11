terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
  required_version = ">= 0.14.9"
}
provider "aws" {
    region = "us-west-2"
    access_key = "AKIAZFFET5QBY5ZW6QF2"
    secret_key = "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"  
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}