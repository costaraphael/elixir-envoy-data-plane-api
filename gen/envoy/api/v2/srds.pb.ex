defmodule Envoy.Api.V2.SrdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.ScopedRoutesDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.api.v2.ScopedRoutesDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamScopedRoutes,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaScopedRoutes,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchScopedRoutes, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.ScopedRoutesDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.ScopedRoutesDiscoveryService.Service
end