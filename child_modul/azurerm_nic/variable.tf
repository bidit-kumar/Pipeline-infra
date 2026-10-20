variable "nic" {
  type = map(object({
    nic_name              = string
    nic_location          = string
    rg_name               = string
    subnet_name           = string
    vnet_name             = string
    ip_config_name        = string
    private_ip_allocation = string
    pip_name              = string
  }))
}