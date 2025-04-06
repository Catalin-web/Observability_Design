module "grafana" {
  source = "./grafana"

  grafana_base_url       = data.terraform_remote_state.api.outputs.grafana_base_url
  grafana_admin_username = data.terraform_remote_state.observability_base.outputs.grafana_admin_username
  grafana_admin_password = data.terraform_remote_state.observability_base.outputs.grafana_admin_password
}

module "nginx" {
  source = "./nginx"

  grafana_base_url       = data.terraform_remote_state.api.outputs.grafana_base_url
  grafana_admin_username = data.terraform_remote_state.observability_base.outputs.grafana_admin_username
  grafana_admin_password = data.terraform_remote_state.observability_base.outputs.grafana_admin_password
  grafana_folder_uid     = module.grafana.grafana_folder_uid
}

module "elasticsearch" {
  source = "./elasticsearch"

  grafana_base_url       = data.terraform_remote_state.api.outputs.grafana_base_url
  grafana_admin_username = data.terraform_remote_state.observability_base.outputs.grafana_admin_username
  grafana_admin_password = data.terraform_remote_state.observability_base.outputs.grafana_admin_password
  grafana_folder_uid     = module.grafana.grafana_folder_uid
}
