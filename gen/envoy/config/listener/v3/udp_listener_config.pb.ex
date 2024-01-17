defmodule Envoy.Config.Listener.V3.UdpListenerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :downstream_socket_config, 5,
    type: Envoy.Config.Core.V3.UdpSocketConfig,
    json_name: "downstreamSocketConfig"

  field :quic_options, 7,
    type: Envoy.Config.Listener.V3.QuicProtocolOptions,
    json_name: "quicOptions"

  field :udp_packet_packet_writer_config, 8,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "udpPacketPacketWriterConfig"
end

defmodule Envoy.Config.Listener.V3.ActiveRawUdpListenerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end