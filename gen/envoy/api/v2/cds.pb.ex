defmodule Envoy.Api.V2.CdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.ClusterDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.api.v2.ClusterDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamClusters,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaClusters,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchClusters, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.ClusterDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.ClusterDiscoveryService.Service
end