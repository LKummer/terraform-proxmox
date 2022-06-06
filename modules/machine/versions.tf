terraform {
  required_version = ">= 1.1"  

  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.10"
    }
    random = {
      source = "hashicorp/random"
      version = "3.3.0"
    }
  }
}
