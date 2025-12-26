# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-multiple-vms"
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-multiple-vms"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-multiple-vms"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interfaces for each VM
resource "azurerm_network_interface" "nic" {
  for_each            = toset(var.vm_names)
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Windows Virtual Machines
resource "azurerm_windows_virtual_machine" "vm" {
  for_each            = toset(var.vm_names)
  name                = each.key
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_D2s_v5"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

# Output VM Private IPs
output "vm_private_ips" {
  value = { for k, nic in azurerm_network_interface.nic : k => nic.ip_configuration[0].private_ip_address }
}
