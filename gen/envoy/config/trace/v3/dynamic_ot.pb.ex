defmodule Envoy.Config.Trace.V3.DynamicOtConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :library, 1, type: :string, deprecated: true
  field :config, 2, type: Google.Protobuf.Struct, deprecated: true
end