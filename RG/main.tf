resource "azurerm_resource_group" "rg-block" {
    name = "RG-one"
    location = "west US"
}

resource "azurerm_virtual_network" "vnet-block" {
  name                = "Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.mame
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg-block.name
  virtual_network_name = azurerm_virtual_network.vnet-block.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_storage_account" "stg-block" {
  name                = "xyzstorageacc"
  resource_group_name = azurerm_resource_group.rg-block.name
  location                 = azurerm_resource_group.rg-block.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "my-container"
  storage_account_name = azurerm_storage_account.stg-block.name
  container_access_type = "private"
}

