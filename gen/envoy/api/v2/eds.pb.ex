defmodule Envoy.Api.V2.EdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.EndpointDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.api.v2.EndpointDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamEndpoints,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaEndpoints,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchEndpoints, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.EndpointDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.EndpointDiscoveryService.Service
end