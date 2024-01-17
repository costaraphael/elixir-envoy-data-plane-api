defmodule Envoy.Service.Discovery.V2.AdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Discovery.V2.AggregatedDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.discovery.v2.AggregatedDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamAggregatedResources,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaAggregatedResources,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Discovery.V2.AggregatedDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.AggregatedDiscoveryService.Service
end