defmodule Envoy.Service.Secret.V3.SdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Secret.V3.SecretDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.secret.v3.SecretDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaSecrets,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :StreamSecrets,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :FetchSecrets,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Secret.V3.SecretDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Secret.V3.SecretDiscoveryService.Service
end