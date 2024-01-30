resource "azurerm_resource_group" "aks_cluster_rg" {
    name = "aks_cluster_rg"
    location = "UK South"
}

resource "azurerm_kubernetes_cluster" "aks_cluster1" {
    name = var.aks_cluster_name
    location = var.cluster_location
    resource_group_name = azurerm_resource_group.aks_cluster_rg.name
    dns_prefix = var.dns_prefix
    kubernetes_version = var.kubernetes_version

    default_node_pool {
      name = "defaultpool"
      node_count = 1
      vm_size = "Standard_DS2_v2" 
    }

    service_principal {
      client_id = var.service_principle_client_id
      client_secret = var.service_principle_secret
    }

}


