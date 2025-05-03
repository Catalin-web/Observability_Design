resource "grafana_data_source" "prometheus" {
  type = "prometheus"
  name = "metrics"
  url  = "http://prometheus-server.default.svc.cluster.local"
}

resource "grafana_data_source" "elasticsearch" {
  type = "elasticsearch"
  name = "logs"
  url  = "https://elasticsearch-master.default.svc.cluster.local:9200"

  basic_auth_enabled  = true
  basic_auth_username = "elastic"

  secure_json_data_encoded = jsonencode({
    basicAuthPassword = "uVLhefdwI6RZzTSB"
  })
}