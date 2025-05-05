resource "helm_release" "opentelemetry-collector-deamonset" {
  name   = "opentelemetry-collector-deamonset"
  chart  = "open-telemetry/opentelemetry-collector"
  values = [templatefile("${path.module}/opentelemetry_collector_deamonset.tflp", {})]
}