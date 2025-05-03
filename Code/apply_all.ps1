Set-Location .\1_observability_base

terraform init
terraform apply --auto-approve

Set-Location ..\2_api
terraform init
terraform apply --auto-approve

Set-Location ..\3_microservices
terraform init
terraform apply --auto-approve

Set-Location ..\4_observability
terraform init
terraform apply --auto-approve

Set-Location ..