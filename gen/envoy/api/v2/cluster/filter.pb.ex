defmodule Envoy.Api.V2.Cluster.Filter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig"
end