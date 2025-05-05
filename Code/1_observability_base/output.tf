output "grafana_admin_username" {
  value     = module.dashboard.grafana_admin_username
  sensitive = true
}

output "grafana_admin_password" {
  value     = module.dashboard.grafana_admin_password
  sensitive = true
}
