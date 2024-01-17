defmodule Envoy.Api.V2.Listener.UdpListenerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :udp_listener_name, 1, type: :string, json_name: "udpListenerName"
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Listener.ActiveRawUdpListenerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end