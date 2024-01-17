defmodule Envoy.Api.V2.Auth.TlsParameters.TlsProtocol do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :TLS_AUTO, 0
  field :TLSv1_0, 1
  field :TLSv1_1, 2
  field :TLSv1_2, 3
  field :TLSv1_3, 4
end

defmodule Envoy.Api.V2.Auth.CertificateValidationContext.TrustChainVerification do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :VERIFY_TRUST_CHAIN, 0
  field :ACCEPT_UNTRUSTED, 1
end

defmodule Envoy.Api.V2.Auth.TlsParameters do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tls_minimum_protocol_version, 1,
    type: Envoy.Api.V2.Auth.TlsParameters.TlsProtocol,
    json_name: "tlsMinimumProtocolVersion",
    enum: true,
    deprecated: false

  field :tls_maximum_protocol_version, 2,
    type: Envoy.Api.V2.Auth.TlsParameters.TlsProtocol,
    json_name: "tlsMaximumProtocolVersion",
    enum: true,
    deprecated: false

  field :cipher_suites, 3, repeated: true, type: :string, json_name: "cipherSuites"
  field :ecdh_curves, 4, repeated: true, type: :string, json_name: "ecdhCurves"
end

defmodule Envoy.Api.V2.Auth.PrivateKeyProvider do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :provider_name, 1, type: :string, json_name: "providerName", deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true

  field :typed_config, 3,
    type: Google.Protobuf.Any,
    json_name: "typedConfig",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Api.V2.Auth.TlsCertificate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :certificate_chain, 1, type: Envoy.Api.V2.Core.DataSource, json_name: "certificateChain"

  field :private_key, 2,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "privateKey",
    deprecated: false

  field :private_key_provider, 6,
    type: Envoy.Api.V2.Auth.PrivateKeyProvider,
    json_name: "privateKeyProvider"

  field :password, 3, type: Envoy.Api.V2.Core.DataSource, deprecated: false
  field :ocsp_staple, 4, type: Envoy.Api.V2.Core.DataSource, json_name: "ocspStaple"

  field :signed_certificate_timestamp, 5,
    repeated: true,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "signedCertificateTimestamp"
end

defmodule Envoy.Api.V2.Auth.TlsSessionTicketKeys do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :keys, 1, repeated: true, type: Envoy.Api.V2.Core.DataSource, deprecated: false
end

defmodule Envoy.Api.V2.Auth.CertificateValidationContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trusted_ca, 1, type: Envoy.Api.V2.Core.DataSource, json_name: "trustedCa"

  field :verify_certificate_spki, 3,
    repeated: true,
    type: :string,
    json_name: "verifyCertificateSpki",
    deprecated: false

  field :verify_certificate_hash, 2,
    repeated: true,
    type: :string,
    json_name: "verifyCertificateHash",
    deprecated: false

  field :verify_subject_alt_name, 4,
    repeated: true,
    type: :string,
    json_name: "verifySubjectAltName",
    deprecated: true

  field :match_subject_alt_names, 9,
    repeated: true,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "matchSubjectAltNames"

  field :require_ocsp_staple, 5, type: Google.Protobuf.BoolValue, json_name: "requireOcspStaple"

  field :require_signed_certificate_timestamp, 6,
    type: Google.Protobuf.BoolValue,
    json_name: "requireSignedCertificateTimestamp"

  field :crl, 7, type: Envoy.Api.V2.Core.DataSource
  field :allow_expired_certificate, 8, type: :bool, json_name: "allowExpiredCertificate"

  field :trust_chain_verification, 10,
    type: Envoy.Api.V2.Auth.CertificateValidationContext.TrustChainVerification,
    json_name: "trustChainVerification",
    enum: true,
    deprecated: false
end