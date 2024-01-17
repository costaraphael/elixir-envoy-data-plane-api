defmodule Envoy.Service.Route.V3.SrdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Route.V3.ScopedRoutesDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.route.v3.ScopedRoutesDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamScopedRoutes,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaScopedRoutes,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchScopedRoutes,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Route.V3.ScopedRoutesDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Route.V3.ScopedRoutesDiscoveryService.Service
end