provider "grafana" {
  url  = data.terraform_remote_state.api.outputs.grafana_base_url
  auth = "${data.terraform_remote_state.observability_base.outputs.grafana_admin_username}:${data.terraform_remote_state.observability_base.outputs.grafana_admin_password}"
}