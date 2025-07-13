# This Terraform configuration deploys a Linux Virtual Machine in Azure with a user-assigned identity and custom cloud-init script.

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "droe-gcs-vm"
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = var.vm_admin_username
  admin_password      = data.azurerm_key_vault_secret.admin_password.value
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "demo-os-disk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.vm_identity.id]
  }

  custom_data = base64encode(file("../config/cloud-init.yaml"))

  tags = {
    environment = "dev"
  }
}
