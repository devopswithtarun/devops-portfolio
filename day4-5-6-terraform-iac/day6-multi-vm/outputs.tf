output "public_ips" {
  description = "Public IP addresses of the VMs"
  value       = azurerm_public_ip.pubip[*].ip_address
}