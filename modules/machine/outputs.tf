output "ssh_ip" {
  value = proxmox_vm_qemu.machine.ssh_host
}

output "user" {
  value = random_pet.cloud_init_user.id
}

output "password" {
  value = random_password.cloud_init_password.result
  sensitive = true
}
