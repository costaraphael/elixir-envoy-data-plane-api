defmodule Envoy.Config.Listener.V3.QuicProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :quic_protocol_options, 1,
    type: Envoy.Config.Core.V3.QuicProtocolOptions,
    json_name: "quicProtocolOptions"

  field :idle_timeout, 2, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :crypto_handshake_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "cryptoHandshakeTimeout"

  field :enabled, 4, type: Envoy.Config.Core.V3.RuntimeFeatureFlag

  field :packets_to_read_to_connection_count_ratio, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "packetsToReadToConnectionCountRatio",
    deprecated: false

  field :crypto_stream_config, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "cryptoStreamConfig"

  field :proof_source_config, 7,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "proofSourceConfig"

  field :connection_id_generator_config, 8,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "connectionIdGeneratorConfig"

  field :server_preferred_address_config, 9,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "serverPreferredAddressConfig",
    deprecated: false
end