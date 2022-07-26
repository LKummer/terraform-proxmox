output "ssh_ip" {
  value = proxmox_vm_qemu.machine.ssh_host
  description = "IP of the created virtual machine."
}

output "user" {
  value = random_pet.cloud_init_user.id
  description = "Name of user created by Cloud Init."
}

output "password" {
  value = random_password.cloud_init_password.result
  sensitive = true
  description = "Password of user created by Cloud Init."
}
