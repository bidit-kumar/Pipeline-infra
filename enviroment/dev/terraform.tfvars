# 1. Resource Groups
rg = {
  rg1 = {
    rg_name     = "dev-rg"
    rg_location = "eastus"
  }
}

# 2. Virtual Networks
vnet = {
  vnet1 = {
    vnet_name     = "dev-vnet"
    vnet_location = "eastus"
    rg_name       = "dev-rg"
    address_space = ["10.0.0.0/16"]
  }
}

# 3. Subnets
subnet = {
  subnet1 = {
    subnet_name      = "web-subnet"
    rg_name          = "dev-rg"
    vnet_name        = "dev-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
}

# 4. Public IP
pip = {
  pip1 = {
    pip_name          = "web-pip"
    pip_location      = "eastus"
    rg_name           = "dev-rg"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

# 5. Network Interface
nic = {
  nic1 = {
    nic_name              = "web-nic"
    nic_location          = "eastus"
    rg_name               = "dev-rg"
    subnet_name           = "web-subnet"
    vnet_name             = "dev-vnet"
    ip_config_name        = "web-ip-config"
    private_ip_allocation = "Dynamic"
    pip_name              = "web-pip"
  }
}

# 6. Linux Virtual Machine
vm = {
  vm1 = {
    vm_name        = "web-vm"
    rg_name        = "dev-rg"
    vm_location    = "eastus"
    vm_size        = "Standard_D2s_v3"
    admin_username = "azureuser"
    admin_password = "bablu@1234"
    pip_name       = "web-pip"
    nic_name       = "web-nic"
  }
}
