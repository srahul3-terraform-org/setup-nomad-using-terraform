terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    http = {
      source = "hashicorp/http"
      version = "3.4.3"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "srahul3"

    workspaces {
      name = "setup-nomad-using-terraform"
    }
  }
  
}
provider "aws" {
  region = var.region
}

provider "http" {
  # Configuration options
}