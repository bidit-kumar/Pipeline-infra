variable "vm" {
  type = map(object({
    vm_name        = string
    rg_name        = string
    vm_location    = string
    vm_size        = string
    admin_username = string
    admin_password = string
    nic_name       = string
    pip_name       = string
  }))
}
