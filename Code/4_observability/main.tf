module "grafana" {
  source = "./grafana"

  grafana_base_url       = data.terraform_remote_state.api.outputs.grafana_base_url
  grafana_admin_username = data.terraform_remote_state.observability_base.outputs.grafana_admin_username
  grafana_admin_password = data.terraform_remote_state.observability_base.outputs.grafana_admin_password
}

module "nginx_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid     = module.grafana.grafana_folder_uid
  service_name = "nginx"
  dashboard_title = "Nginx"
}

module "grafana_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid     = module.grafana.grafana_folder_uid
  service_name = "grafana"
  dashboard_title = "Grafana"
}
