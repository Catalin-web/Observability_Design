resource "helm_release" "kube-state-metrics" {
  name   = "kube-state-metrics"
  chart  = "prometheus-community/kube-state-metrics"
  values = [templatefile("${path.module}/kube_state_metrics_values.tflp", {})]

  depends_on = [helm_release.prometheus]
}