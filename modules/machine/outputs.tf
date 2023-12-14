output "id" {
  value       = proxmox_virtual_environment_vm.machine.vm_id
  description = "Proxmox virtual machine ID."
}

output "ip" {
  value       = one(setsubtract(flatten(proxmox_virtual_environment_vm.machine.ipv4_addresses), ["127.0.0.1"]))
  description = "IP of the created virtual machine."
}

output "user" {
  value       = random_pet.cloud_init_user.id
  description = "Name of user created by Cloud Init."
}

output "password" {
  value       = random_password.cloud_init_password.result
  sensitive   = true
  description = "Password of user created by Cloud Init."
}
