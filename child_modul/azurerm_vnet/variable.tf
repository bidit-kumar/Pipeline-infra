variable "vnet" {
  type = map(object({
    vnet_name      = string
    vnet_location  = string
    rg_name        = string
    address_space  = list(string)
  }))
}