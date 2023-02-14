
resource "azurerm_virtual_machine" "privatevm" {
  name                  = "privatevm"
  location              = "${azurerm_resource_group.myterraformgroup.location}"
  resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest" 
}
  storage_os_disk {
    name              = "osdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "<computername>"
    admin_username = "<username>"
    admin_password = "<password>"
    custom_data    = "${file("packages1.sh")}"
  }
  os_profile_linux_config {
        disable_password_authentication = false
        ssh_keys {
            path     = "/home/zippyops/.ssh/authorized_keys"
            key_data = "<your key hear>"
      }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

  tags = {
    environment = "staging"
  }
}

