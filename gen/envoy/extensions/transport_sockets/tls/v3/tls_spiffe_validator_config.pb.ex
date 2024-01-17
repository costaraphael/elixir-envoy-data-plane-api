defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :trust_bundle, 2, type: Envoy.Config.Core.V3.DataSource, json_name: "trustBundle"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trust_domains, 1,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain,
    json_name: "trustDomains",
    deprecated: false
end