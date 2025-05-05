module "grafana" {
  source = "./grafana"
}

module "nginx_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "nginx"
  dashboard_title    = "Nginx"
}

module "grafana_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "grafana"
  dashboard_title    = "Grafana"
}

module "elasticsearch_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "elasticsearch"
  dashboard_title    = "Elasticsearch"
}

module "fluentd_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "fluentd"
  dashboard_title    = "Fluentd"
}

module "prometheus_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "prometheus"
  dashboard_title    = "Prometheus"
}

module "kibana_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "kibana"
  dashboard_title    = "Kibana"
}

module "microservice1_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "microservice1"
  dashboard_title    = "Microservice1"
}

module "microservice2_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "microservice2"
  dashboard_title    = "Microservice2"
}

module "microservice3_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "microservice3"
  dashboard_title    = "Microservice3"
}
