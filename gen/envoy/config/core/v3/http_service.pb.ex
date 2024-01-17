defmodule Envoy.Config.Core.V3.HttpService do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri"

  field :request_headers_to_add, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false
end