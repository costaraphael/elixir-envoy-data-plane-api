defmodule Envoy.Extensions.TransportSockets.ProxyProtocol.V3.ProxyProtocolUpstreamTransport do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig

  field :transport_socket, 2,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false
end