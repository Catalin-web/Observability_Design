resource "helm_release" "fluentd" {
  name   = "fluentd"
  chart  = "bitnami/fluentd"
  values = [templatefile("${path.module}/fluentd_values.tflp", {})]

  depends_on = [helm_release.elasticsearch]
}