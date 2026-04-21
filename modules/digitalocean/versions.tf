terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-digitalocean"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.DIGITALOCEAN_TOKEN
}