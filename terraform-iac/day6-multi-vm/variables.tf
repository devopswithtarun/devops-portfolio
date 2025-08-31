variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "day6vm"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
  default     = "tarunadmin"
}

variable "ssh_public_key" {
  description = "SSH public key for authentication"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the VMs"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}
