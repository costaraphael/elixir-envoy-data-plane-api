defmodule Envoy.Service.Discovery.V2.SdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Discovery.V2.SecretDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.discovery.v2.SecretDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaSecrets,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :StreamSecrets,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :FetchSecrets, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Service.Discovery.V2.SecretDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.SecretDiscoveryService.Service
end