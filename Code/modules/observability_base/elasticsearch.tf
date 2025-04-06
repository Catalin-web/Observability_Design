resource "helm_release" "elasticsearch" {
  name   = "elasticsearch"
  chart  = "elastic/elasticsearch"
  values = [templatefile("${path.module}/elasticsearch_values.tflp", {})]
}