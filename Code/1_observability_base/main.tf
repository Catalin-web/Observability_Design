module "logs" {
  source = "../modules/observability/logs"
}

module "metrics" {
  source = "../modules/observability/metrics"
}

module "dashboard" {
  source = "../modules/observability/dashboard"
}
