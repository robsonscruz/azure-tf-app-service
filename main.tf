resource "azurerm_app_service_plan" "main" {
    name                            = var.service_plan_name
    sku {
        tier                        = var.service_plan_sku_tier
        size                        = var.service_plan_sku_size
        capacity                    = var.service_plan_sku_capacity
    }
    kind                            = var.service_plan_kind
    reserved                        = var.service_plan_reserved
    tags                            = var.tags
    location                        = var.location
    resource_group_name             = var.resource_group_name

    timeouts {
        create = "2h"
        update = "2h"
        delete = "2h"
    }
}

resource "azurerm_app_service" "main" {
    name                      = var.app_name
    location                  = var.location
    resource_group_name       = var.resource_group_name
    app_service_plan_id       = azurerm_app_service_plan.main.id
    client_affinity_enabled   = var.app_client_affinity_enabled
    client_cert_enabled       = var.app_client_cert_enabled
    https_only                = true

    site_config {
        linux_fx_version  = var.app_linux_fx_version
        app_command_line  = var.app_command_line
        always_on         = var.app_always_on
        scm_type          = "LocalGit"
        use_32_bit_worker_process = true
    }

    app_settings = {
        DOCKER_REGISTRY_SERVER_URL = var.docker_registry_url
        DOCKER_REGISTRY_SERVER_USERNAME = var.docker_registry_username
        DOCKER_REGISTRY_SERVER_PASSWORD = var.docker_registry_password
        WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    }
    identity {
        type         = "SystemAssigned"
    }
  tags = var.tags
  depends_on = [azurerm_app_service_plan.main]
}