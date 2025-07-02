provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  subscription_id = "add your sub ID"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

resource "random_integer" "extra" {
  min = 100
  max = 999
}

# Combine random values into a valid name (<= 24 chars, only lowercase and digits)
locals {
  storage_name = "staticsite${random_integer.rand.result}${random_integer.extra.result}"
}

resource "azurerm_resource_group" "rg" {
  name     = "staticsite-rg"
  location = "westeurope"
}

resource "azurerm_storage_account" "sa" {
  name                     = local.storage_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_storage_account_static_website" "website" {
  storage_account_id = azurerm_storage_account.sa.id
  index_document     = "index.html"
  error_404_document = "404.html"

  depends_on = [azurerm_storage_account.sa]
}
