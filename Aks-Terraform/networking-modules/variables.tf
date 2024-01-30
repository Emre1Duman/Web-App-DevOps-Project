variable "resource_group_name" {
    description = "Name of resource group."
    type = string
    # default = "Networking-Resource-Group"
}

variable "resource_location" {
    description = "location of resource group"
    type = string
    # default = "UK South"  
}

variable "vnet_address_space" {
    description = "Address space for the virtual network"
    type = list(string)
    # default = [ "10.0.0.0/16" ]
  
}