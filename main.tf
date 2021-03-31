# Configure the Azure provider
#terraform {
  # required_providers {
  #   azurerm = {
  #     source = "hashicorp/azurerm"
  #     version = ">= 2.26"
  #   }
  # }
#}

provider "azurerm" {
  features {}
  subscription_id = var.subsId
  client_id       = var.clientId
  client_secret   = var.clientSecret
  tenant_id       = var.tenantId
}

resource "azurerm_resource_group" "gerardomysqlresourcegroup" {
  name     = "gerardomysqlresourcegroup"
  location = "${var.location}"
}

resource "azurerm_mysql_server" "mysql_server_instance1" {
  name                = "${var.stack_name}"
  location            = azurerm_resource_group.gerardomysqlresourcegroup.location
  resource_group_name = azurerm_resource_group.gerardomysqlresourcegroup.name

  administrator_login          = "${var.bbdd_admin_user}"
  administrator_login_password = "${var.bbdd_admin_pwd}"

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