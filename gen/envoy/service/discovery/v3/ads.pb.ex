defmodule Envoy.Service.Discovery.V3.AdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Discovery.V3.AggregatedDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.discovery.v3.AggregatedDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamAggregatedResources,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaAggregatedResources,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Discovery.V3.AggregatedDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V3.AggregatedDiscoveryService.Service
end