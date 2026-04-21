terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-supabase"
    }
  }

  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
  }
}

provider "supabase" {
  # Cần cung cấp token để Terraform gọi API của Supabase
  # Biến này sẽ được tự động map từ môi trường (TF_VAR_SUPABASE_ACCESS_TOKEN)
  access_token = var.SUPABASE_ACCESS_TOKEN
}