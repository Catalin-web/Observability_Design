resource "helm_release" "kibana" {
  name   = "kibana"
  chart  = "bitnami/kibana"
  values = [templatefile("${path.module}/kibana_values.tflp", {})]

  depends_on = [helm_release.elasticsearch]
}