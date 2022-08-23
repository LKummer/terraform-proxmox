terraform {
  required_version = ">= 1.1"
}

module "example_machine" {
  # When using these modules in your own templates, you will need to use a Git source
  # with an attribute to pin the module's version.
  # source = "github.com/LKummer/terraform-proxmox//modules/machine?ref=1.0.0"
  source = "../../modules/machine"

  proxmox_api_url     = var.proxmox_api_url
  proxmox_target_node = var.proxmox_target_node
  proxmox_template    = "alpine-3.16.2-1"

  name                   = "example-machine"
  description            = "Example machine description."
  on_boot                = true
  memory                 = 2048
  cores                  = 2
  disk_pool              = "local-lvm"
  disk_size              = "10G"
  cloud_init_public_keys = var.cloud_init_public_keys
}
