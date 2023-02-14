resource "azurerm_network_security_group" "dbsg" {
    name                = "zippyopsNetworksgdb"
    location            = "centralus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
}
 resource "azurerm_network_security_rule" "myterraformnsgdb" {

        name                       = "HTTP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "VirtualNetwork"
        destination_address_prefix = "VirtualNetwork"
        resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
        network_security_group_name = "${azurerm_network_security_group.dbsg.name}"
    }
  

