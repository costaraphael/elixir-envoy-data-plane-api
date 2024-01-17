defmodule Envoy.Extensions.Filters.Network.DirectResponse.V3.Config do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :response, 1, type: Envoy.Config.Core.V3.DataSource
end