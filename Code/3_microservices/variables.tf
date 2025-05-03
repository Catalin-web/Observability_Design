variable "microservices" {
  type = map(string)
  default = {
    microservice1 = "microservice1"
    microservice2 = "microservice2"
    microservice3 = "microservice3"
  }
}