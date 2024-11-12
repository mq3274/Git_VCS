resource "azurerm_resource_group" "rg-block" {
    name = "RG-one"
    location = "west US"
}

resource "azurerm_resource_group" "rg-block1" {
    name = "RG-two"
    location = "west US"
}

