terraform {
  cloud {
    organization = "20206205tech"
    workspaces {
      name = "infra-oracle"
    }
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.OCI_TENANCY_OCID
  user_ocid    = var.OCI_USER_OCID
  fingerprint  = var.OCI_FINGERPRINT
  private_key  = var.OCI_PRIVATE_KEY
  region       = var.OCI_REGION
}