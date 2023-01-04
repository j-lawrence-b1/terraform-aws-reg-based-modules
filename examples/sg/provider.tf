terraform {
  required_version = "= 1.1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.4.1"
    }
  }
  backend "s3" {} # Define backend config in ./backend.hcl
}

provider "aws" {
  region = var.region
}
