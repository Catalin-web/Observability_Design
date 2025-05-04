locals {
  grafana_config_map_name = "grafana-config-map"
}

resource "random_password" "grafana_password" {
  length = 32
}

resource "kubernetes_secret" "grafana_admin_credentials" {
  metadata {
    name = "grafana-admin-credentials"
  }
  data = {
    username = "admin"
    password = random_password.grafana_password.result
  }
}

resource "kubernetes_config_map" "grafana" {
  metadata {
    name = local.grafana_config_map_name
  }

  data = {
    "grafana.ini" = "${file("${path.module}/grafana.ini")}"
  }
}

resource "helm_release" "grafana" {
  name  = "grafana"
  chart = "bitnami/grafana"
  values = [templatefile("${path.module}/grafana_values.tflp", {
    username   = kubernetes_secret.grafana_admin_credentials.data.username
    password   = kubernetes_secret.grafana_admin_credentials.data.password
    config_map = local.grafana_config_map_name
  })]

  depends_on = [kubernetes_config_map.grafana]
}

