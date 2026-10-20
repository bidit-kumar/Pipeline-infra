module "azurerm_resouce_group" {
  source = "../../child_modul/azurerm_resource_group"
  rg     = var.rg
}

module "vnet" {
  depends_on = [module.azurerm_resouce_group]
  source     = "../../child_modul/azurerm_vnet"
  vnet       = var.vnet
}

module "subnet" {
  source = "../../child_modul/azurerm_subnet"

  subnet = var.subnet

  depends_on = [module.vnet]
}

module "pip" {
  depends_on = [module.azurerm_resouce_group]
  source     = "../../child_modul/azurerm_pip"
  pip        = var.pip
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../child_modul/azurerm_nic"
  nic        = var.nic
}

module "vm" {
  depends_on = [module.nic]
  source     = "../../child_modul/azurerm_linux_vm"
  vm         = var.vm
}
