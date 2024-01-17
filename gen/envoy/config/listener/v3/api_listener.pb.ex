defmodule Envoy.Config.Listener.V3.ApiListener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :api_listener, 1, type: Google.Protobuf.Any, json_name: "apiListener"
end