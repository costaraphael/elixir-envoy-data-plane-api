defmodule Envoy.Service.Cluster.V3.CdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Cluster.V3.ClusterDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.cluster.v3.ClusterDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamClusters,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaClusters,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchClusters,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Cluster.V3.ClusterDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Cluster.V3.ClusterDiscoveryService.Service
end