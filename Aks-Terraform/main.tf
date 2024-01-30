terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.0.0"
    }
  }
}

provider "azurerm" {
    features {}
    client_id       = "cc437313-03e4-4c4c-aa87-0a2d38e0012a"
    client_secret   = "_X58Q~B_iv1Wzta8syHCWHSGS.7iOUQkEbUGEaoG"
    subscription_id = "72a60eac-3f3a-45ed-9f35-798b0974e8a9"
    tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "aks_networking" {
  source = "./networking-modules"
  resource_group_name = "Networking-Resource-Group"
  resource_location = "UK South" 
  vnet_address_space = [ "10.0.0.0/16" ]
}

module "aks_cluster" {
  source = "./aks-cluster-module"
  aks_cluster_name = "terraform-aks-cluster"
  cluster_location = "UK South"
  dns_prefix = "myaks-project"
  kubernetes_version = "1.26.6"
  service_principle_client_id = "cc437313-03e4-4c4c-aa87-0a2d38e0012a"
  service_principle_secret = "_X58Q~B_iv1Wzta8syHCWHSGS.7iOUQkEbUGEaoG"
  networking_resource_group_name_output = module.aks_networking.networking_resource_group_name
  vnet_id_output = module.aks_networking.vnet_id
  control_plane_subnet_id_output = module.aks_networking.control_plane_subnet_id
  worker_node_subnet_id = module.aks_networking.worker_node_subnet_id
  aks_nsg_id = module.aks_networking.aks_nsg_id


  
}



