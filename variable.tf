variable "subscription_id" {}
variable "resource_group_name" {}
variable "location" {}
variable "service_plan_name" {}
variable "service_plan_sku_tier" {}
variable "service_plan_sku_size" {}
variable "service_plan_sku_capacity" { default = 1}
variable "service_plan_reserved" { default = true}
variable "service_plan_kind" { default = "Linux"}
variable "tags" {
    default = {
        env = "dev"
    }
}
variable "app_name" {}
variable "app_client_affinity_enabled" { default = true}
variable "app_client_cert_enabled" { default = false}
variable "app_linux_fx_version" {}
variable "app_command_line" { default = ""}
variable "app_always_on" { default = false}
variable "docker_registry_url" {}
variable "docker_registry_username" { default = ""}
variable "docker_registry_password" { default = null}
