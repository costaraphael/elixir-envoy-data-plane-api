defmodule Envoy.Api.V2.RdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.RouteDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.api.v2.RouteDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamRoutes, stream(Envoy.Api.V2.DiscoveryRequest), stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaRoutes,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchRoutes, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.RouteDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.RouteDiscoveryService.Service
end

defmodule Envoy.Api.V2.VirtualHostDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.api.v2.VirtualHostDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaVirtualHosts,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)
end

defmodule Envoy.Api.V2.VirtualHostDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.VirtualHostDiscoveryService.Service
end