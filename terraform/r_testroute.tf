resource "random_uuid" "apisix-route-id" {
}

resource "restapi_object" "apisix-route" {
  provider = restapi.apisix-routes
  path     = "/"

  read_path    = "/{id}"
  create_path  = "/{id}"
  destroy_path = "/{id}"
  update_path  = "/{id}"

  read_method    = "GET"
  create_method  = "PUT"
  destroy_method = "DELETE"
  update_method  = "PATCH"

  object_id = random_uuid.apisix-route-id.result
  debug     = true

  data = jsonencode({
    methods     = ["GET"]
    uri         = "/node-red-apisix"
    upstream_id = resource.restapi_object.apisix-upstream.object_id
    name        = "Node-RED APISIX API"
    plugins = {
      "proxy-rewrite" = {
        uri = "/nodered"
      }
      "basic-auth" = {
      }
    }
      labels = {
        API_VERSION = "1"
      }
  })
}