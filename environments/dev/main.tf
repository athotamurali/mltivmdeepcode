# environments/dev/main.tf
provider "azurerm" {
  features {}
}

module "vms" {
  source = "../../"

  location        = var.location
  admin_username  = var.admin_username
  public_key_path = var.public_key_path
}
