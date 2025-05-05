output "grafana_admin_username" {
  value     = kubernetes_secret.grafana_admin_credentials.data.username
  sensitive = true
}

output "grafana_admin_password" {
  value     = kubernetes_secret.grafana_admin_credentials.data.password
  sensitive = true
}
