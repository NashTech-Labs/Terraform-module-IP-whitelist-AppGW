variable "resource_group_name" {
  description = "The name of the resource group where the Application Gateway is located."
  type        = string
}

variable "app_gateway_name" {
  description = "The name of the existing Application Gateway."
  type        = string
}

variable "backend_addresses" {
  description = "The list of backend addresses to be added to the backend pool."
  type        = list(string)
  default     = []
}

variable "ip_restrictions" {
  description = "List of IP restriction rules."
  type = list(object({
    name     = string
    ip_range = string
  }))
  default = []
}

