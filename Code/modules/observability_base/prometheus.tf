resource "helm_release" "prometheus" {
  name   = "prometheus"
  chart  = "prometheus-community/prometheus"
  values = [templatefile("${path.module}/prometheus_values.yaml", {})]
}