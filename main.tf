terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo2"
  }
}

resource "aws_s3_bucket" "kajalbucket1" {
  bucket = "my-tf-kajal112test-bucket"

  tags = {
    Name        = "my-tf-kajal112test-bucket"
    Environment = "Dev"
  }
}

output "ec2_public_ips" {
        value = aws_instance.my_ec2_instance.public_ip
}
