defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.TlsProtocol do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :TLS_AUTO, 0
  field :TLSv1_0, 1
  field :TLSv1_1, 2
  field :TLSv1_2, 3
  field :TLSv1_3, 4
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SubjectAltNameMatcher.SanType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SAN_TYPE_UNSPECIFIED, 0
  field :EMAIL, 1
  field :DNS, 2
  field :URI, 3
  field :IP_ADDRESS, 4
  field :OTHER_NAME, 5
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.TrustChainVerification do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :VERIFY_TRUST_CHAIN, 0
  field :ACCEPT_UNTRUSTED, 1
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tls_minimum_protocol_version, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.TlsProtocol,
    json_name: "tlsMinimumProtocolVersion",
    enum: true,
    deprecated: false

  field :tls_maximum_protocol_version, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.TlsProtocol,
    json_name: "tlsMaximumProtocolVersion",
    enum: true,
    deprecated: false

  field :cipher_suites, 3, repeated: true, type: :string, json_name: "cipherSuites"
  field :ecdh_curves, 4, repeated: true, type: :string, json_name: "ecdhCurves"
  field :signature_algorithms, 5, repeated: true, type: :string, json_name: "signatureAlgorithms"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.PrivateKeyProvider do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :provider_name, 1, type: :string, json_name: "providerName", deprecated: false

  field :typed_config, 3,
    type: Google.Protobuf.Any,
    json_name: "typedConfig",
    oneof: 0,
    deprecated: false

  field :fallback, 4, type: :bool
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :certificate_chain, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "certificateChain"

  field :private_key, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "privateKey",
    deprecated: false

  field :pkcs12, 8, type: Envoy.Config.Core.V3.DataSource, deprecated: false

  field :watched_directory, 7,
    type: Envoy.Config.Core.V3.WatchedDirectory,
    json_name: "watchedDirectory"

  field :private_key_provider, 6,
    type: Envoy.Extensions.TransportSockets.Tls.V3.PrivateKeyProvider,
    json_name: "privateKeyProvider"

  field :password, 3, type: Envoy.Config.Core.V3.DataSource, deprecated: false
  field :ocsp_staple, 4, type: Envoy.Config.Core.V3.DataSource, json_name: "ocspStaple"

  field :signed_certificate_timestamp, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "signedCertificateTimestamp"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :keys, 1, repeated: true, type: Envoy.Config.Core.V3.DataSource, deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CertificateProviderPluginInstance do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :instance_name, 1, type: :string, json_name: "instanceName"
  field :certificate_name, 2, type: :string, json_name: "certificateName"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SubjectAltNameMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :san_type, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SubjectAltNameMatcher.SanType,
    json_name: "sanType",
    enum: true,
    deprecated: false

  field :matcher, 2, type: Envoy.Type.Matcher.V3.StringMatcher, deprecated: false
  field :oid, 3, type: :string
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.SystemRootCerts do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trusted_ca, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "trustedCa",
    deprecated: false

  field :ca_certificate_provider_instance, 13,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateProviderPluginInstance,
    json_name: "caCertificateProviderInstance",
    deprecated: false

  field :system_root_certs, 17,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.SystemRootCerts,
    json_name: "systemRootCerts"

  field :watched_directory, 11,
    type: Envoy.Config.Core.V3.WatchedDirectory,
    json_name: "watchedDirectory"

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

  field :match_typed_subject_alt_names, 15,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SubjectAltNameMatcher,
    json_name: "matchTypedSubjectAltNames"

  field :match_subject_alt_names, 9,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "matchSubjectAltNames",
    deprecated: true

  field :require_signed_certificate_timestamp, 6,
    type: Google.Protobuf.BoolValue,
    json_name: "requireSignedCertificateTimestamp"

  field :crl, 7, type: Envoy.Config.Core.V3.DataSource
  field :allow_expired_certificate, 8, type: :bool, json_name: "allowExpiredCertificate"

  field :trust_chain_verification, 10,
    type:
      Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.TrustChainVerification,
    json_name: "trustChainVerification",
    enum: true,
    deprecated: false

  field :custom_validator_config, 12,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customValidatorConfig"

  field :only_verify_leaf_cert_crl, 14, type: :bool, json_name: "onlyVerifyLeafCertCrl"

  field :max_verify_depth, 16,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxVerifyDepth",
    deprecated: false
end