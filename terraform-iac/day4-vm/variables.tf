variable "prefix" {
    type = string
    default = "tarun"
    description = "Prefix for resource names"
}

variable "location" {
    type = string
    default = "UK south"
    description = "Azure region"
}

variable "vm_size" {
    type = string
    default = "Standard_B1s"
    description = "Small, low-cost size"
}

variable "admin_username" {
    type = string
    default = "ubuntu"
    description = "Linux admin user"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to your SSH public key"
}

variable "vnet_cidr" {
    type = string
    default = "10.10.0.0/16"
}

variable "subnet_cidr" {
    type = string
    default = "10.10.1.0/24"
}

variable "allowed_ssh_cidr" {
  type        = string
  default     = "0.0.0.0/0" # TEMP for first run; replace with YOUR_IP/32 below
  description = "CIDR allowed to SSH (use 83.104.175.26/32)"
}
