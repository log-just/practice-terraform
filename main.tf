terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" { # 강의는 
      bucket         = "terraform-s3-bucket" # s3 bucket 이름
      key            = "terraform/own-your-path/terraform.tfstate" # s3 내에서 저장되는 경로를 의미합니다.
      region         = "ap-northeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lock"
    }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "toonsquare"
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  root_block_device {
    encrypted = true
  }

  tags = {
    Name = var.instance_name
  }
}
