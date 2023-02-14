resource "azurerm_network_security_group" "myterraformnsg1" {
    name                = "hemaNetworkSecurityGroupprivate"
    location            = "centralus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
}
 resource "azurerm_network_security_rule" "myterraformnsg1" {

        name                       = "HTTP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.128/25"
        resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
        network_security_group_name = "${azurerm_network_security_group.myterraformnsg1.name}"
    }

