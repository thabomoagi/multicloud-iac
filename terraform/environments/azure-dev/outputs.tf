output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = module.development_vnet.vnet_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.development_vnet.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.development_vnet.private_subnet_id
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.development_vnet.resource_group_name
}

output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = module.development_vm.vm_id
}

output "vm_public_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = module.development_vm.vm_public_ip
}

output "ssh_private_key_pem" {
  description = "The SSH private key for accessing the Virtual Machine"
  value       = module.development_vm.ssh_private_key_pem
  sensitive   = true
}
