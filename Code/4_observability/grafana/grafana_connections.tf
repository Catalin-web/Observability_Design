resource "grafana_data_source" "prometheus" {
  type = "prometheus"
  name = "metrics"
  url  = "http://prometheus-server.default.svc.cluster.local"
}

resource "grafana_data_source" "elasticsearch" {
  type = "elasticsearch"
  name = "logs"
  url  = "http://elasticsearch.default.svc.cluster.local:9200"

  basic_auth_username = "elastic"
  json_data_encoded = jsonencode(
    {
      includeFrozen              = false
      logLevelField              = ""
      logMessageField            = ""
      maxConcurrentShardRequests = 5
      timeField                  = "@timestamp"
    }
  )
}