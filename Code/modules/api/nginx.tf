resource "helm_release" "nginx" {
  name   = "nginx"
  chart  = "oci://registry-1.docker.io/bitnamicharts/nginx"
  values = [templatefile("${path.module}/values.tflp", {})]
}