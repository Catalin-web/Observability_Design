resource "helm_release" "opentelemetry-collector" {
  name   = "opentelemetry-collector"
  chart  = "open-telemetry/opentelemetry-collector"
  values = [templatefile("${path.module}/opentelemetry_collector.tflp", {})]
}