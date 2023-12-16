variable "proxmox_api_url" {
  description = "Proxmox VE API server URL."
  type        = string
}

variable "authorized_key" {
  description = "SSH public key to add with Cloud Init."
  type        = string
}
