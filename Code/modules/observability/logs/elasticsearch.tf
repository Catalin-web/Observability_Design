resource "helm_release" "elasticsearch" {
  name   = "elasticsearch"
  chart  = "bitnami/elasticsearch"
  values = [templatefile("${path.module}/elasticsearch_values.tflp", {})]
}