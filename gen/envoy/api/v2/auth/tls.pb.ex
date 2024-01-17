defmodule Envoy.Api.V2.Auth.UpstreamTlsContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_tls_context, 1,
    type: Envoy.Api.V2.Auth.CommonTlsContext,
    json_name: "commonTlsContext"

  field :sni, 2, type: :string, deprecated: false
  field :allow_renegotiation, 3, type: :bool, json_name: "allowRenegotiation"
  field :max_session_keys, 4, type: Google.Protobuf.UInt32Value, json_name: "maxSessionKeys"
end

defmodule Envoy.Api.V2.Auth.DownstreamTlsContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :session_ticket_keys_type, 0

  field :common_tls_context, 1,
    type: Envoy.Api.V2.Auth.CommonTlsContext,
    json_name: "commonTlsContext"

  field :require_client_certificate, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "requireClientCertificate"

  field :require_sni, 3, type: Google.Protobuf.BoolValue, json_name: "requireSni"

  field :session_ticket_keys, 4,
    type: Envoy.Api.V2.Auth.TlsSessionTicketKeys,
    json_name: "sessionTicketKeys",
    oneof: 0

  field :session_ticket_keys_sds_secret_config, 5,
    type: Envoy.Api.V2.Auth.SdsSecretConfig,
    json_name: "sessionTicketKeysSdsSecretConfig",
    oneof: 0

  field :disable_stateless_session_resumption, 7,
    type: :bool,
    json_name: "disableStatelessSessionResumption",
    oneof: 0

  field :session_timeout, 6,
    type: Google.Protobuf.Duration,
    json_name: "sessionTimeout",
    deprecated: false
end

defmodule Envoy.Api.V2.Auth.CommonTlsContext.CombinedCertificateValidationContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_validation_context, 1,
    type: Envoy.Api.V2.Auth.CertificateValidationContext,
    json_name: "defaultValidationContext",
    deprecated: false

  field :validation_context_sds_secret_config, 2,
    type: Envoy.Api.V2.Auth.SdsSecretConfig,
    json_name: "validationContextSdsSecretConfig",
    deprecated: false
end

defmodule Envoy.Api.V2.Auth.CommonTlsContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :validation_context_type, 0

  field :tls_params, 1, type: Envoy.Api.V2.Auth.TlsParameters, json_name: "tlsParams"

  field :tls_certificates, 2,
    repeated: true,
    type: Envoy.Api.V2.Auth.TlsCertificate,
    json_name: "tlsCertificates"

  field :tls_certificate_sds_secret_configs, 6,
    repeated: true,
    type: Envoy.Api.V2.Auth.SdsSecretConfig,
    json_name: "tlsCertificateSdsSecretConfigs",
    deprecated: false

  field :validation_context, 3,
    type: Envoy.Api.V2.Auth.CertificateValidationContext,
    json_name: "validationContext",
    oneof: 0

  field :validation_context_sds_secret_config, 7,
    type: Envoy.Api.V2.Auth.SdsSecretConfig,
    json_name: "validationContextSdsSecretConfig",
    oneof: 0

  field :combined_validation_context, 8,
    type: Envoy.Api.V2.Auth.CommonTlsContext.CombinedCertificateValidationContext,
    json_name: "combinedValidationContext",
    oneof: 0

  field :alpn_protocols, 4, repeated: true, type: :string, json_name: "alpnProtocols"
end