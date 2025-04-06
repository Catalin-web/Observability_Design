resource "grafana_data_source" "prometheus" {
  type = "prometheus"
  name = "metrics"
  url  = "http://prometheus-server.default.svc.cluster.local"
}