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
  service_name       = "elasticsearch-master"
  dashboard_title    = "Elasticsearch Master"
}

module "prometheus_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "prometheus-server"
  dashboard_title    = "Prometheus Server"
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
  service_name       = "microservice1-nginx"
  dashboard_title    = "Microservice1"
}

module "microservice2_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "microservice2-nginx"
  dashboard_title    = "Microservice2"
}

module "microservice3_dashboard" {
  source = "../modules/service_dashboard"

  grafana_folder_uid = module.grafana.grafana_folder_uid
  service_name       = "microservice3-nginx"
  dashboard_title    = "Microservice3"
}
