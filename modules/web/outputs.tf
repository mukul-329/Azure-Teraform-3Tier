output "public_ip" {
  value = azurerm_public_ip.web_ip.ip_address
}