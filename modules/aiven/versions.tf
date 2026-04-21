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
  # Không cần truyền api_token ở đây.
  # Provider sẽ tự động đọc từ biến môi trường AIVEN_TOKEN trên Terraform Cloud.
}