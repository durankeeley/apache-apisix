resource "random_uuid" "apisix-upstream-id" {
}

resource "restapi_object" "apisix-upstream" {
  provider = restapi.apisix-upstreams
  path     = "/"

  read_path    = "/{id}"
  create_path  = "/{id}"
  destroy_path = "/{id}"
  update_path  = "/{id}"

  read_method    = "GET"
  create_method  = "PUT"
  destroy_method = "DELETE"
  update_method  = "PATCH"

  object_id = random_uuid.apisix-upstream-id.result
  debug     = true

  data = jsonencode({
  name      = "Node-RED Test API"
  type      = "roundrobin"
  nodes     = {
    "192.168.1.230:1880" = 1
  }
  pass_host = "pass"
})
}