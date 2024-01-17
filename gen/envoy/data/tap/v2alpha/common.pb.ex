defmodule Envoy.Data.Tap.V2alpha.Body do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :body_type, 0

  field :as_bytes, 1, type: :bytes, json_name: "asBytes", oneof: 0
  field :as_string, 2, type: :string, json_name: "asString", oneof: 0
  field :truncated, 3, type: :bool
end