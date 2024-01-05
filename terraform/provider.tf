variable "admin_api_key" {
  description = "Apache APISIX API Key"
  type        = string
  sensitive   = true
}

variable "admin_api_uri" {
  description = "Apache APISIX API Key"
  type        = string
  sensitive   = true
}

terraform {
  required_providers {
    restapi = {
      source  = "Mastercard/restapi"
      version = "1.18.1"
    }
  }
}

provider "restapi" {
  alias                = "apisix-consumers"
  uri                  = "http://${var.admin_api_uri}:9180/apisix/admin/consumers"
  write_returns_object = true
  debug                = true

  headers = {
    "X-API-KEY"    = "${var.admin_api_key}",
    "Content-Type" = "application/json"
  }
  id_attribute = "value/username"
}

provider "restapi" {
  alias                = "apisix-routes"
  uri                  = "http://${var.admin_api_uri}:9180/apisix/admin/routes"
  write_returns_object = true
  debug                = true

  headers = {
    "X-API-KEY"    = "${var.admin_api_key}",
    "Content-Type" = "application/json"
  }
  id_attribute = "id"
}

provider "restapi" {
  alias                = "apisix-upstreams"
  uri                  = "http://${var.admin_api_uri}:9180/apisix/admin/upstreams"
  write_returns_object = true
  debug                = true

  headers = {
    "X-API-KEY"    = "${var.admin_api_key}",
    "Content-Type" = "application/json"
  }
  id_attribute = "id"
}
