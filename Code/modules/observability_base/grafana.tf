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

resource "helm_release" "grafana" {
  name  = "grafana"
  chart = "grafana/grafana"
  values = [templatefile("${path.module}/grafana_values.tflp", {
    secret_name  = kubernetes_secret.grafana_admin_credentials.metadata[0].name
    username_key = "username"
    password_key = "password"
  })]
}

