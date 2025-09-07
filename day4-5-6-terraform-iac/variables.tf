variable "rg_name" {
    type = string
    default = "rg-tarun-terraform"
    description = "Name of the resource group"
}

variable "location" {
    type = string
    default = "UK south"
    description = "Azure region for the resource group"
}