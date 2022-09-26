module "workspace_context" {
  source = "git@github.com:caring/tf-modules.git//aws/workspace?ref=v2.0.0"
}

terraform {
  required_version = "= 0.15.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.39.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "= 2.2.0"
    }
  }

  backend "s3" {
    bucket         = "caring-tf-state"
    key            = "tcloud_test/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "caring-tf-state-lock"


  }
}

provider "aws" {
  assume_role {
    role_arn = module.workspace_context.workspace_iam_roles[terraform.workspace]
  }
  region = "us-east-1"
}