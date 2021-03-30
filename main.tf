# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

#resource "azurerm_resource_group" "rg" {
#  name     = "myTFResourceGroup"
#  location = "westus2"
#}

resource "azurerm_resource_group" "gerardomysqlresourcegroup" {
  name     = "gerardomysqlresourcegroup"
  location = "West Europe"
}

resource "azurerm_mysql_server" "$${var.stack_name}" {
  name                = var.stack_name
  location            = azurerm_resource_group.gerardomysqlresourcegroup.location
  resource_group_name = azurerm_resource_group.gerardomysqlresourcegroup.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}
