defmodule Envoy.Extensions.TransportSockets.Tap.V3.Tap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false

  field :transport_socket, 2,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false
end