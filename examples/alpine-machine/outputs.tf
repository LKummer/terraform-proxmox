output "ssh_ip" {
  value       = module.example_machine.ip
  description = "IP of the created virtual machine."
}

output "ssh_user" {
  value       = module.example_machine.user
  description = "Name of user created by Cloud Init."
}
