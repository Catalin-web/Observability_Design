variable "grafana_base_url" {
  type      = string
  sensitive = false
}

variable "grafana_admin_username" {
  type      = string
  sensitive = true
}

variable "grafana_admin_password" {
  type      = string
  sensitive = true
}
