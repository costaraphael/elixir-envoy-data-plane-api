defmodule Envoy.Api.V2.Listener.QuicProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_concurrent_streams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrentStreams"

  field :idle_timeout, 2, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :crypto_handshake_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "cryptoHandshakeTimeout"
end