terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.22.2"
    }
  }

  required_version = "~> 1.7"
}