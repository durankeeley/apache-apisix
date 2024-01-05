variable "api_username" {
  description = "Apache APISIX API Username"
  type        = string
  sensitive   = true
}

resource "random_password" "password" {
  length  = 24
  special = true
}

resource "local_file" "api_key" {
  content  = resource.random_password.password.result
  filename = "${var.api_username}-api.key"
}

resource "restapi_object" "apisix-consumers_durankeeley" {
  provider = restapi.apisix-consumers
  path     = "/"

  read_path    = "/{id}"
  create_path  = "/"
  destroy_path = "/{id}"
  update_path  = "/"

  read_method    = "GET"
  create_method  = "PUT"
  destroy_method = "DELETE"
  update_method  = "PUT"

  object_id = var.api_username
  debug     = true

  data = jsonencode({
    plugins = {
      "basic-auth" = {
        password = "${resource.random_password.password.result}"
        username = var.api_username
      }
    }
    username = var.api_username
    desc     = "API Key for ${var.api_username}"
  })
}
