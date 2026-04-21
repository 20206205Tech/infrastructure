terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-upstash"
    }
  }

  required_providers {
    upstash = {
      source  = "upstash/upstash"
      version = "~> 2.1.0"
    }
  }
}

# Cấu hình provider lấy thông tin từ variables
provider "upstash" {
  email   = var.UPSTASH_EMAIL
  api_key = var.UPSTASH_API_KEY
}