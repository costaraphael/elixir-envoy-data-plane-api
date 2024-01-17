defmodule Envoy.Extensions.HealthCheckers.Thrift.V3.Thrift do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :method_name, 1, type: :string, json_name: "methodName", deprecated: false

  field :transport, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 3,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType,
    enum: true,
    deprecated: false
end