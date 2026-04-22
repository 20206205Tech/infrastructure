terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-heroku" # Tên workspace mới
    }
  }

  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
    herokux = {
      source  = "davidji99/herokux"
      version = "~> 0.0"
    }
  }
}

provider "heroku" {
  # Biến này sẽ được Doppler đẩy vào TF_VAR_HEROKU_API_KEY nếu có sau này
  api_key = var.HEROKU_API_KEY
}