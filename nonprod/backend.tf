# terraform {
#   backend "azurerm" {
#     resource_group_name  = "iac-backend-rg"
#     storage_account_name = "iacstate1234"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }

#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0"
#     }
#   }
# }