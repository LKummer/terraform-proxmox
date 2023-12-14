resource "random_pet" "cloud_init_user" {
  length = 2
}

resource "random_password" "cloud_init_password" {
  length = 64
}

data "proxmox_virtual_environment_vms" "all" {
  node_name = var.proxmox_target_node
}

resource "proxmox_virtual_environment_vm" "machine" {
  name        = var.name
  description = var.description

  node_name = var.proxmox_target_node != null ? var.proxmox_target_node : one(coalescelist([for vm in data.proxmox_virtual_environment_vms.all.vms : vm.name == var.proxmox_template ? [vm] : []]...)).node_name
  vm_id     = var.id

  on_boot = var.on_boot

  agent {
    enabled = true
  }

  clone {
    vm_id = one(coalescelist([for vm in data.proxmox_virtual_environment_vms.all.vms : vm.name == var.proxmox_template ? [vm] : []]...)).vm_id
  }

  startup {
    order = "10"
  }

  disk {
    datastore_id = var.disk_pool
    interface    = "scsi0"
    size         = var.disk_size
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    user_account {
      keys     = [trimspace(var.cloud_init_public_keys)]
      password = random_password.cloud_init_password.result
      username = random_pet.cloud_init_user.id
    }
  }

  network_device {
    mac_address = var.mac_address
  }

  operating_system {
    type = "l26"
  }
}
