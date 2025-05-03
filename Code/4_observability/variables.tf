data "terraform_remote_state" "observability_base" {
  backend = "local"

  config = {
    path = "../1_observability_base/terraform.tfstate"
  }
}

data "terraform_remote_state" "api" {
  backend = "local"

  config = {
    path = "../2_api/terraform.tfstate"
  }
}
