variable "proxmox_api_url" {
  description = "Proxmox VE API server URL."
  type        = string
}

variable "cloud_init_public_keys" {
  description = "SSH public keys to add with Cloud Init."
  type        = string
  default     = ""
}
