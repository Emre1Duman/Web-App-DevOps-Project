# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with the necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to successfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be met with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Terraform

- **Network Service Module:** 
  - Within the Network module, I created 3 files, variables.tf, main.tf and outputs.tf.
  - Variables.tf contained variables for the Network Resource group name, resource location and Vnet address space.
  - The main.tf had multiple resources defined using the variables in variables.tf. I defined a resource group, a virtual network (Vnet), which included 2 subnets for the control plane and the worker node. Lastly, a Network Security Group (NSG) was defined with 2 security rules to only allow access to my public IP (IPV4) from the Kube-APiserver and SSH Trafic.
  - Outputs.tf contained the output variables of the module, to be utilised in later code.
 
- **Cluster Module:**
  - The 2nd module was for the cluster itself, with this module also including a variables, main and outputs file.
  - Within the variables.tf file I defined variables for the aks_cluster_name, cluster location, dns_prefix, k8s version, and service principle client/secret ID.
  - I additionally included the output variables from the networking module as input variables for the new cluster module, these will be useful when defining the networking resources and configuring the cluster.
  - I defined the necessary Azure resources for provisioning the cluster itself in the main.tf, this included the AKS cluster, node pool and service principals using the variables defined earlier.
  - The outputs.tf file contained essential information about the provisioned AKS cluster, including the cluster name, ID and AKS kubeconfig

- **The Main Configuration:**
  - The Main file integrates both modules using the associated variables file
  - After applying the config and successfully provisioning it with Terraform, I need to retrieve the kubeconfig file.
  - This is done through the Azure CLI with the command "az aks get-credentials --resource-group <Your-Resource-Group-Name> --name <Your-AKS-Cluster-Name>".
  - To ensure this has worked we use "kubectl get nodes", this command lists the nodes in our AKS cluster, confirming we have successfully connected.
 
## Kubernetes

- We now need to proceed with the deployment of the containerized application to the Kubernetes cluster, for this we require a manifest file.

  

## UML Diagram
![Screenshot 2023-08-31 at 15 49 26](https://github.com/Emre1Duman/Web-App-DevOps-Project/blob/main/UML.png)

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
