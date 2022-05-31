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
  ciuser = var.cloud_init_user
  cipassword = var.cloud_init_password
  sshkeys = var.cloud_init_public_keys
}
