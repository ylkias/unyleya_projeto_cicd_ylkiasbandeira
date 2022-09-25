output "aks_id" {
  value = azurerm_kubernetes_cluster.aksunyleya.id
}
output "client_certificate" {
  value = azurerm_kubernetes_cluster.aksunyleya.kube_config.0.client_certificate
}
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aksunyleya.kube_config_raw
  sensitive = true
}


output "acr_id" {
  value = azurerm_container_registry.acrProjUnyleya.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acrProjUnyleya.login_server

}