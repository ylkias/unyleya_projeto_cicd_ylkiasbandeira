# Criação do AKS Cluster
resource "azurerm_resource_group" "rgunyleya" {
  name     = "rg-unyleya"
  location = "eastus"
}


resource "azurerm_container_registry" "acrProjUnyleya" {
  name                = "acrProjUnyleya"
  resource_group_name = azurerm_resource_group.rgunyleya.name
  location            = azurerm_resource_group.rgunyleya.location
  sku                 = "Standard"
  admin_enabled       = false

}

resource "azurerm_kubernetes_cluster" "aksunyleya" {
  name                = "aks-unyleya"
  resource_group_name = azurerm_resource_group.rgunyleya.name
  location            = azurerm_resource_group.rgunyleya.location
  dns_prefix          = "dnsunyleya"

  default_node_pool {
    name       = "node01"
    node_count = 1
    vm_size    = "Standard_D2_V2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }


  role_based_access_control {
    enabled = true
  }

}

resource "azurerm_role_assignment" "aksunyleya_to_acrProjUnyleya" {
  scope                = azurerm_container_registry.acrProjUnyleya.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aksunyleya.kubelet_identity.0.object_id
}

