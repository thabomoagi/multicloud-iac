output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.main.id
}

output "vm_public_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_public_ip.main.ip_address
}

output "admin_username" {
  description = "The admin username for the Virtual Machine"
  value       = var.admin_username
}

output "ssh_private_key_pem" {
  description = "The SSH private key for accessing the Virtual Machine"
  value       = tls_private_key.ssh.private_key_pem
  sensitive   = true
}
