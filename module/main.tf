provider "azurerm" {
  features {}
}

data "azurerm_application_gateway" "example" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_application_gateway" "example" {
  name                = data.azurerm_application_gateway.example.name
  resource_group_name = data.azurerm_application_gateway.example.resource_group_name
  location            = data.azurerm_application_gateway.example.location

  sku {
    name     = data.azurerm_application_gateway.example.sku[0].name
    tier     = data.azurerm_application_gateway.example.sku[0].tier
    capacity = data.azurerm_application_gateway.example.sku[0].capacity
  }

  gateway_ip_configuration {
    name      = data.azurerm_application_gateway.example.gateway_ip_configuration[0].name
    subnet_id = data.azurerm_application_gateway.example.gateway_ip_configuration[0].subnet_id
  }

  frontend_port {
    name = data.azurerm_application_gateway.example.frontend_port[0].name
    port = data.azurerm_application_gateway.example.frontend_port[0].port
  }

  frontend_ip_configuration {
    name                 = data.azurerm_application_gateway.example.frontend_ip_configuration[0].name
    subnet_id            = data.azurerm_application_gateway.example.frontend_ip_configuration[0].subnet_id
    private_ip_address   = data.azurerm_application_gateway.example.frontend_ip_configuration[0].private_ip_address
    private_ip_address_allocation = data.azurerm_application_gateway.example.frontend_ip_configuration[0].private_ip_address_allocation
  }

  backend_address_pool {
    name = data.azurerm_application_gateway.example.backend_address_pool[0].name

    dynamic "backend_addresses" {
      for_each = var.backend_addresses
      content {
        ip_address = backend_addresses.value
      }
    }
  }

  backend_http_settings {
    name                  = data.azurerm_application_gateway.example.backend_http_settings[0].name
    cookie_based_affinity = data.azurerm_application_gateway.example.backend_http_settings[0].cookie_based_affinity
    port                  = data.azurerm_application_gateway.example.backend_http_settings[0].port
    protocol              = data.azurerm_application_gateway.example.backend_http_settings[0].protocol
    request_timeout       = data.azurerm_application_gateway.example.backend_http_settings[0].request_timeout
  }

  http_listener {
    name                           = data.azurerm_application_gateway.example.http_listener[0].name
    frontend_ip_configuration_name = data.azurerm_application_gateway.example.http_listener[0].frontend_ip_configuration_name
    frontend_port_name             = data.azurerm_application_gateway.example.http_listener[0].frontend_port_name
    protocol                       = data.azurerm_application_gateway.example.http_listener[0].protocol
  }

  request_routing_rule {
    name                       = data.azurerm_application_gateway.example.request_routing_rule[0].name
    rule_type                  = data.azurerm_application_gateway.example.request_routing_rule[0].rule_type
    http_listener_name         = data.azurerm_application_gateway.example.request_routing_rule[0].http_listener_name
    backend_address_pool_name  = data.azurerm_application_gateway.example.request_routing_rule[0].backend_address_pool_name
    backend_http_settings_name = data.azurerm_application_gateway.example.request_routing_rule[0].backend_http_settings_name
  }

  probe {
    name                                    = data.azurerm_application_gateway.example.probe[0].name
    protocol                                = data.azurerm_application_gateway.example.probe[0].protocol
    path                                    = data.azurerm_application_gateway.example.probe[0].path
    interval                                = data.azurerm_application_gateway.example.probe[0].interval
    timeout                                 = data.azurerm_application_gateway.example.probe[0].timeout
    unhealthy_threshold                     = data.azurerm_application_gateway.example.probe[0].unhealthy_threshold
    match {
      status_codes = data.azurerm_application_gateway.example.probe[0].match[0].status_codes
    }
  }

  dynamic "ip_restriction" {
    for_each = var.ip_restrictions
    content {
      name      = ip_restriction.value.name
      ip_range  = ip_restriction.value.ip_range
    }
  }

  tags = data.azurerm_application_gateway.example.tags
}

