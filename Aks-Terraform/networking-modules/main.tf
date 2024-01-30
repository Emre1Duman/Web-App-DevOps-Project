resource "azurerm_resource_group" "resource1" {
    name = var.resource_group_name
    location = var.resource_location
}

resource "azurerm_virtual_network" "aks_vnet" {
    name = "aks-vnet"
    address_space = var.vnet_address_space
    location = azurerm_resource_group.resource1.location
    resource_group_name = azurerm_resource_group.resource1.name
}

resource "azurerm_subnet" "control_plane_sub" {
    name = "control-plane-subnet"
    resource_group_name = azurerm_resource_group.resource1.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes = [ "10.0.1.0/24" ]     
}

resource "azurerm_subnet" "worker_node_sub" {
    name = "worker-node-subnet"
    resource_group_name = azurerm_resource_group.resource1.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes = [ "10.0.2.0/24" ]     
}

resource "azurerm_network_security_group" "net-group1" {
    name = "aks-nsg"
    location = azurerm_resource_group.resource1.location
    resource_group_name = azurerm_resource_group.resource1.name

    security_rule {
        name = "kube-apiserver-rule"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "2.100.68.176"
        destination_address_prefix = "*"
        }
    
    security_rule {
      name = "ssh-rule"
      priority = 101
      direction = "Inbound"
      access = "Allow"
      protocol = "Tcp"
      source_port_range = "*"
      destination_port_range = "*"
      source_address_prefix = "2.100.68.176"
      destination_address_prefix = "*"
    }

}




