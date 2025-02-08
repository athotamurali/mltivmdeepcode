provider "azurerm" {
  features {}
}

module "vm" {
  source = "./modules/vm"
  environment = var.environment
  vm_count    = var.vm_count
  vm_size     = var.vm_size
  location    = var.location
}
