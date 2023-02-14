
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "ZippyOPSVM"
    location              = "centralus"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "OsDisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "OpenLogic"
        offer     = "CentOS"
        sku       = "7-CI"
        version   = "latest"
    }

    os_profile {
        computer_name  = "<computername>"
        admin_username = "<user anme>"
        admin_password = "<password>"
        custom_data    = "${file("packages.sh")}"
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
