output "vnet_id" {
    description = "Stores the ID of the Vnet"
    value = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
    description = "Hold the ID of the control plane subnet within the Vnet"
    value = azurerm_subnet.control_plane_sub.id
}

output "worker_node_subnet_id" {
    description = "Holds the ID of the woker node subnet within the Vnet"
    value = azurerm_subnet.worker_node_sub.id
}

output "networking_resource_group_name" {
    description = "Name of the Azure Resource Group were the networking resources were provisioned in"
    value = azurerm_resource_group.resource1.name
}

output "aks_nsg_id" {
    description = "Store the ID of the NSG"
    value = azurerm_network_security_group.net-group1.id
}