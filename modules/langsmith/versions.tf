terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-langsmith"
    }
  }

  required_providers {
    langsmith = {
      source  = "bogware/langsmith"
      version = "~> 0.8.0"
    }
  }
}

provider "langsmith" {}