# Azure WebApp - Image from Hub Docker
  - Terraform 1.0

## Run terraform

```bash
$ terraform init
$ terraform plan -var subscription_id="XXXXXXXXXXX"
$ terraform apply -var subscription_id="XXXXXXXXXXX"
$ terraform destroy -var subscription_id="XXXXXXXXXXX"
```

## Output
```bash
output "service_plan_main" {
    value = azurerm_app_service_plan.main
}
output "app_service_main" {
    value = azurerm_app_service.main
}
```