defmodule Envoy.Service.Route.V3.RdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Route.V3.RouteDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.route.v3.RouteDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamRoutes,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaRoutes,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchRoutes,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Route.V3.RouteDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Route.V3.RouteDiscoveryService.Service
end

defmodule Envoy.Service.Route.V3.VirtualHostDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.route.v3.VirtualHostDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaVirtualHosts,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Route.V3.VirtualHostDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Route.V3.VirtualHostDiscoveryService.Service
end