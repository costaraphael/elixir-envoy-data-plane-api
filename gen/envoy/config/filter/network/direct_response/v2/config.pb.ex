defmodule Envoy.Config.Filter.Network.DirectResponse.V2.Config do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :response, 1, type: Envoy.Api.V2.Core.DataSource
end