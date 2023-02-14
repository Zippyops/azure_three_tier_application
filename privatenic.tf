resource "azurerm_network_interface" "main" {
  name                = "privatenic"
  location            = "${azurerm_resource_group.myterraformgroup.location}"
  resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
  network_security_group_id = "${azurerm_network_security_group.myterraformnsg1.id}"
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.myterraformsubnet1.id}"
    private_ip_address_allocation = "Dynamic"
  }
}


