output "grafana_admin_username" {
  value     = module.observability_base.grafana_admin_username
  sensitive = true
}

output "grafana_admin_password" {
  value     = module.observability_base.grafana_admin_password
  sensitive = true
}
