module "microservice" {
  for_each = var.microservices
  source   = "../modules/microservice"

  microservice_name = each.value
}


