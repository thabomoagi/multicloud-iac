variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "southafricanorth"
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the Virtual Network"
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
  default     = "10.1.2.0/24"
}
