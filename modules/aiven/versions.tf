terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-aiven"
    }
  }

  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">= 4.0.0"
    }
  }
}

provider "aiven" {
  api_token = var.aiven_token
}