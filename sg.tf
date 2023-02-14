resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "zippyopsNetworkSecurityGroup"
    location            = "centralus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
}
 resource "azurerm_network_security_rule" "myterraformnsg" {

        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
        network_security_group_name = "${azurerm_network_security_group.myterraformnsg.name}"
    }
