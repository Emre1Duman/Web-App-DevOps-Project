output "aks_cluster_name" {
    description = "name of the provisioned cluster"
    value = azurerm_kubernetes_cluster.aks_cluster1.name
}

output "aks_cluster_id" {
    description = "Id of the cluster"
    value = azurerm_kubernetes_cluster.aks_cluster1.id
}

output "aks_kubeconfig" {
    description = "K8s configuration file of cluster, essential for interacting/managing with kubctl."
    value = azurerm_kubernetes_cluster.aks_cluster1.kube_config
}