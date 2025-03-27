module "vnet" {
  source              = "../../modules/terraform-azure-vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets
  enable_nsg          = var.enable_nsg
  tags               = var.tags
}



resource "azurerm_network_interface" "dev_nic" {
  name                = "dev-nic"
  location            = "East US"
  resource_group_name = "challenge"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.subnet_ids["dev-subnet-001"]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "dev_vm" {
  name                  = "dev-vm"
  location              = "East US"
  resource_group_name   = "challenge"
  network_interface_ids = [azurerm_network_interface.dev_nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "dev-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "dev-vm"
    admin_username = "azureuser"
    admin_password = "P@ssword123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
