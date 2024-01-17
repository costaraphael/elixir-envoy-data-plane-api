defmodule Envoy.Config.Filter.Network.MongoProxy.V2.MongoProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :delay, 3, type: Envoy.Config.Filter.Fault.V2.FaultDelay
  field :emit_dynamic_metadata, 4, type: :bool, json_name: "emitDynamicMetadata"
end