variable "aks_cluster_name" {
    description = "Name of aks cluster"
    type = string
    # default = "aks_cluster"
}

variable "cluster_location" {
    description = "Location of the cluster resource"
    type = string
    # default = "UK South"
}

variable "dns_prefix" {
    description = "dns prefix of cluster"
    type = string
    # default = "akscluster"
}

variable "kubernetes_version" {
    description = "K8s Version to be used"
    type = string
    # default = "1.23.0"
}

variable "service_principle_client_id" {
    description = "Client ID for the service principal associated with the cluster"
    type = string
  
}

variable "service_principle_secret" {
    description = "Client secret for the service principal associated with the cluster"
    type = string
  
}

#Output variables from Networking module

variable "networking_resource_group_name_output" {
    type = string
}

variable "vnet_id_output" {
    type = string
}

variable "control_plane_subnet_id_output" {
    type = string
}

variable "worker_node_subnet_id" {
    type = string 
}

variable "aks_nsg_id" {
    type = string
  
}
