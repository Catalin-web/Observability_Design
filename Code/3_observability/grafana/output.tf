output "grafana_folder_uid" {
  value     = grafana_folder.terraform_dashboards.uid
  sensitive = false
}