variable "prefix" {
    description = "Prefix for resource name"
    type = string
    default = "day5net"
}

variable "location" {
    description = "Azure location"
    type = string
    default = "UK south"
}

variable "allowed_ssh_cidr" {
    description = "My public IP in CIDR (81.77.226.243/32) to allow SSH"
    type = string
}