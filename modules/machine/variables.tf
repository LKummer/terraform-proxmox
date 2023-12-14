variable "proxmox_api_url" {
  description = "Proxmox VE API server URL."
  type        = string
}

variable "proxmox_target_node" {
  description = "Proxmox node the machine will be created on."
  type        = string
  default     = null
}

variable "proxmox_template" {
  description = "Proxmox template to clone."
  type        = string
}

variable "id" {
  description = "ID of the created machine. Uses next available ID when empty."
  type        = number
  default     = null
}

variable "name" {
  description = "Name of the created machine."
  type        = string
}

variable "description" {
  description = "Description of the created machine."
  type        = string

  validation {
    condition     = 0 < length(var.description)
    error_message = "The argument \"description\" must not be empty to avoid state mismatch when cloning a template with description."
  }
}

variable "on_boot" {
  description = "Machine is started up on boot when true."
  type        = bool
}

variable "memory" {
  description = "Memory size in MB."
  type        = number
}

variable "cores" {
  description = "CPU core count."
  type        = number
}

variable "mac_address" {
  description = "Network interface MAC address."
  type        = string
  default     = null
}

variable "disk_pool" {
  description = "Storage pool to use for the machine's disk."
  type        = string
}

variable "disk_size" {
  description = "Disk size to use in GB."
  type        = number
}

variable "cloud_init_public_keys" {
  description = "SSH public keys to add with Cloud Init."
  type        = string
}
