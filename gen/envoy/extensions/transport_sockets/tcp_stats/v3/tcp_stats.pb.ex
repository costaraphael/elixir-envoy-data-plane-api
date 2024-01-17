defmodule Envoy.Extensions.TransportSockets.TcpStats.V3.Config do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :transport_socket, 1,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false

  field :update_period, 2,
    type: Google.Protobuf.Duration,
    json_name: "updatePeriod",
    deprecated: false
end