defmodule Envoy.Extensions.Filters.Network.MongoProxy.V3.MongoProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :delay, 3, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay
  field :emit_dynamic_metadata, 4, type: :bool, json_name: "emitDynamicMetadata"
  field :commands, 5, repeated: true, type: :string
end