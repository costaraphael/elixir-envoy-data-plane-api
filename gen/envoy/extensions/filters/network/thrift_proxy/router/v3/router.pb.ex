defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Router.V3.Router do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :close_downstream_on_upstream_error, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "closeDownstreamOnUpstreamError"
end