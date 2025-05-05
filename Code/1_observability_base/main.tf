module "logs" {
  source = "../modules/observability/logs"
}

module "metrics" {
  source = "../modules/observability/metrics"
}

module "dashboard" {
  source = "../modules/observability/dashboard"
}

module "opentelemetry" {
  source = "../modules/observability/opentelemetry"

  depends_on = [module.logs, module.metrics, module.dashboard]
}
