variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region for VM"
  default     = "southafricanorth"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the NIC will be attached"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for the virtual machine"
  default     = "azureuser"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
  default     = "Standard_B1s"
}
