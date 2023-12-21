terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  # Enable for Remote S3 TFState
  #  backend "s3" {
  #    bucket         = "lambda-fastapi-terraform-state-backend"
  #    key            = "terraform.tfstate"
  #    region         = "eu-west-1"
  #    dynamodb_table = "terraform_state"
  #  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Owner     = "Chamo"
      ManagedBy = "Terraform"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}