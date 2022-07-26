terraform {
  required_version = ">= 1.1"
}

module "example_machine" {
  # When using these modules in your own templates, you will need to use a Git source
  # with an attribute to pin the module's version.
  # source = "github.com/LKummer/terraform-proxmox//modules/machine?ref=v0.1.0"
  source = "../../modules/machine"

  proxmox_api_url = var.proxmox_api_url
  proxmox_target_node = var.proxmox_target_node
  proxmox_template = "Alpine-3.16.0-2537c0e0"

  name = "example-machine"
  on_boot = true
  memory = 2048
  cores = 2
  disk_pool = "local-lvm"
  disk_size = "10G"
  cloud_init_public_keys = var.cloud_init_public_keys
}
