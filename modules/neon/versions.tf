terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-neon"
    }
  }

  required_providers {
    neon = {
      source  = "kislerdm/neon"
      version = "~> 0.6.0"
    }
  }
}

# Cấu hình provider lấy thông tin từ variables
provider "neon" {
  api_key = var.NEON_API_KEY
}