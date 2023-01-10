terraform {
  required_version = "= 1.3.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
  }
  backend "local" { path = "./terraform.tfstate" }
}

provider "aws" {
  region = var.region
}
