locals {
  tags = {
    "managed"     = "terraformed"
    "owner"       = "zippyops"
    "environment" = "learning"
  }
}
resource "azurerm_mysql_server" "test" {
  name                = "zippyops"
  location            = "${azurerm_resource_group.myterraformgroup.location}"
  resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

  sku {
    name     = "GP_Gen5_2"
    capacity = 2
    tier     = "GeneralPurpose"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "zippyops"
  administrator_login_password = "ZIPPYOPSzipp11"
  version                      = "5.7"
  ssl_enforcement              = "Disabled"
}
resource "azurerm_mysql_firewall_rule" "main" {
  name                 = "AlllowAzureServices"
  resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
  server_name          = "${azurerm_mysql_server.test.name}"
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"
}

resource "azurerm_mysql_database" "test" {
  name                 = "hemadb"
  resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
  server_name          = "${azurerm_mysql_server.test.name}"
  charset              = "utf8"
  collation            = "utf8_unicode_ci"
}
resource "azurerm_mysql_virtual_network_rule" "test" {
  name                = "mysqlrule"
  resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
  server_name         = "${azurerm_mysql_server.test.name}"
  subnet_id           = "${azurerm_subnet.main.id}"
}
