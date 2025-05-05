resource "helm_release" "prometheus-node-exporter" {
  name   = "prometheus-node-exporter"
  chart  = "prometheus-community/prometheus-node-exporter"
  values = [templatefile("${path.module}/prometheus_node_exporter_values.tflp", {})]

  depends_on = [helm_release.prometheus]
}