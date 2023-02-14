resource "azurerm_public_ip" "myterraformpublicip" {
  name                = "test"
  location            = "centralus"
  resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
  allocation_method = "Dynamic"
}

