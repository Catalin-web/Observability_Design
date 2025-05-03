resource "helm_release" "microservice" {
  name  = var.microservice_name
  chart = "oci://registry-1.docker.io/bitnamicharts/nginx"
  values = [templatefile("${path.module}/microservice.tflp", {
    microservice_name = var.microservice_name
  })]
}