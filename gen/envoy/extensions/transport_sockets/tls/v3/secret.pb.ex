defmodule Envoy.Extensions.TransportSockets.Tls.V3.GenericSecret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :secret, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :sds_config, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "sdsConfig"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.Secret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :name, 1, type: :string

  field :tls_certificate, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate,
    json_name: "tlsCertificate",
    oneof: 0

  field :session_ticket_keys, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys,
    json_name: "sessionTicketKeys",
    oneof: 0

  field :validation_context, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext,
    json_name: "validationContext",
    oneof: 0

  field :generic_secret, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.GenericSecret,
    json_name: "genericSecret",
    oneof: 0
end