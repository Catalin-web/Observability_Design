resource "helm_release" "opentelemetry-collector-deployment" {
  name   = "opentelemetry-collector-deployment"
  chart  = "open-telemetry/opentelemetry-collector"
  values = [templatefile("${path.module}/opentelemetry_collector_deployment.tflp", {})]
}