terraform {
  required_version = ">= 1.1"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}
