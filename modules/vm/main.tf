provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testenv" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "testenv" {
  depends_on = [azurerm_resource_group.testenv]
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.testenv.location
  resource_group_name = azurerm_resource_group.testenv.name
}

resource "azurerm_subnet" "testenv" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.testenv.name
  virtual_network_name = azurerm_virtual_network.testenv.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "testenv" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.testenv.location
  resource_group_name = azurerm_resource_group.testenv.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "testenv" {
  depends_on = [
    azurerm_resource_group.testenv,
    azurerm_virtual_network.testenv,
    azurerm_subnet.testenv
  ]
  name                = var.nic_name
  location            = azurerm_resource_group.testenv.location
  resource_group_name = azurerm_resource_group.testenv.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.testenv.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.testenv.id
  }
}

resource "azurerm_linux_virtual_machine" "testenv" {
   depends_on = [
    azurerm_resource_group.testenv,
    azurerm_virtual_network.testenv,
    azurerm_subnet.testenv,
    azurerm_network_interface.testenv,
  ]
  name                  = var.vm_name
  location              = azurerm_resource_group.testenv.location
  resource_group_name   = azurerm_resource_group.testenv.name
  network_interface_ids = [azurerm_network_interface.testenv.id]
  size               = var.vm_size
  admin_username  = var.admin_username
  admin_password = var.admin_password
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  
}
