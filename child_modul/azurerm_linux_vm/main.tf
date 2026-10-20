data "azurerm_network_interface" "nic" {
  for_each = var.vm

  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.vm

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}


resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm

  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.vm_location
  size                = each.value.vm_size

  admin_username = each.value.admin_username

  # UPDATED 1: Password authentication disabled
  disable_password_authentication = true

  # UPDATED 2: SSH public key added
  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}
