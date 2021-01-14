terraform {
  required_version = ">= 0.13.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.23.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 1.4"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.2"
    }
  }
}