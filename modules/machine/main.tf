resource "random_pet" "cloud_init_user" {
  length = 2
}

resource "random_password" "cloud_init_password" {
  length = 64
}

resource "proxmox_vm_qemu" "machine" {
  vmid = var.id
  name = var.name
  target_node = var.proxmox_target_node
  clone = var.proxmox_template
  full_clone = var.full_clone

  onboot = var.on_boot
  memory = var.memory
  cores = var.cores
  scsihw = "virtio-scsi-pci"
  agent = 1

  network {
    model = "virtio"
    macaddr = var.mac_address
    bridge = "vmbr0"
  }

  disk {
    type = "scsi"
    storage = var.disk_pool
    size = var.disk_size
  }
  bootdisk = "scsi0"
  boot = "c"

  os_type = "cloud-init"
  ciuser = random_pet.cloud_init_user.id
  cipassword = random_password.cloud_init_password.result
  sshkeys = var.cloud_init_public_keys
}
