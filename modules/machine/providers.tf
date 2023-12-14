provider "proxmox" {
  endpoint = var.proxmox_api_url
  insecure = true

  # Uncomment following lines to enable debug logging.
  # pm_log_enable = true
  # pm_log_levels = {
  #   _default = "debug"
  #   _capturelog = ""
  # }
}
