defmodule Envoy.Type.V3.SemanticVersion do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :major_number, 1, type: :uint32, json_name: "majorNumber"
  field :minor_number, 2, type: :uint32, json_name: "minorNumber"
  field :patch, 3, type: :uint32
end