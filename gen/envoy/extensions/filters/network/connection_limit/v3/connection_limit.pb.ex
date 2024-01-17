defmodule Envoy.Extensions.Filters.Network.ConnectionLimit.V3.ConnectionLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :max_connections, 2,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxConnections",
    deprecated: false

  field :delay, 3, type: Google.Protobuf.Duration

  field :runtime_enabled, 4,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end