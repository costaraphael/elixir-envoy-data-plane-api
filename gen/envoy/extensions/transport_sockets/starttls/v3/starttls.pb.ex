defmodule Envoy.Extensions.TransportSockets.Starttls.V3.StartTlsConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cleartext_socket_config, 1,
    type: Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer,
    json_name: "cleartextSocketConfig"

  field :tls_socket_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext,
    json_name: "tlsSocketConfig",
    deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.Starttls.V3.UpstreamStartTlsConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cleartext_socket_config, 1,
    type: Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer,
    json_name: "cleartextSocketConfig"

  field :tls_socket_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext,
    json_name: "tlsSocketConfig",
    deprecated: false
end