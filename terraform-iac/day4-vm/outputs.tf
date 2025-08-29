output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "ssh_command" {
  value = "ssh -i ${replace(var.ssh_public_key_path, ".pub", "")} ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}

