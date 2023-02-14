resource "azurerm_resource_group" "myterraformgroup" {
    name     = "netapplication"
    location = "centralus"

    tags {
        environment = "Terraform Demo"
    }
}
