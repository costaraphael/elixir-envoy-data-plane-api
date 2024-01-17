defmodule Envoy.Extensions.Matching.CommonInputs.EnvironmentVariable.V3.Config do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
end