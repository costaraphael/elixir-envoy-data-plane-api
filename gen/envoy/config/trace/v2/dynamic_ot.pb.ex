defmodule Envoy.Config.Trace.V2.DynamicOtConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :library, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct
end