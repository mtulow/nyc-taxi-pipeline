output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
}

output "tls_private_key_azure" {
  value     = tls_private_key.vm_ssh.private_key_pem
  sensitive = true
}

output "tls_private_key_snowflake" {
  value     = tls_private_key.snow_ssh.private_key_pem
  sensitive = true
}