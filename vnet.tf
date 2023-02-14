resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "zippyopsVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "centralus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
}
resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "publicsubnet"
    resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"
    address_prefix       = "10.0.0.0/24"
}
resource "azurerm_subnet" "myterraformsubnet1" {
    name                 = "privatesubnet1"
    resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix       = "10.0.1.0/24"
}
resource "azurerm_subnet" "main" {
    name                 = "dbsubnet"
    resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix       = "10.0.2.0/24"
    service_endpoints    = ["Microsoft.Sql"]
}   
