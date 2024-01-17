defmodule Envoy.Api.V2.Auth.GenericSecret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :secret, 1, type: Envoy.Api.V2.Core.DataSource, deprecated: false
end

defmodule Envoy.Api.V2.Auth.SdsSecretConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :sds_config, 2, type: Envoy.Api.V2.Core.ConfigSource, json_name: "sdsConfig"
end

defmodule Envoy.Api.V2.Auth.Secret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :name, 1, type: :string

  field :tls_certificate, 2,
    type: Envoy.Api.V2.Auth.TlsCertificate,
    json_name: "tlsCertificate",
    oneof: 0

  field :session_ticket_keys, 3,
    type: Envoy.Api.V2.Auth.TlsSessionTicketKeys,
    json_name: "sessionTicketKeys",
    oneof: 0

  field :validation_context, 4,
    type: Envoy.Api.V2.Auth.CertificateValidationContext,
    json_name: "validationContext",
    oneof: 0

  field :generic_secret, 5,
    type: Envoy.Api.V2.Auth.GenericSecret,
    json_name: "genericSecret",
    oneof: 0
end