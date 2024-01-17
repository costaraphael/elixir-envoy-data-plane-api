defmodule Envoy.Service.Endpoint.V3.LedsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Endpoint.V3.LocalityEndpointDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.endpoint.v3.LocalityEndpointDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaLocalityEndpoints,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Endpoint.V3.LocalityEndpointDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Endpoint.V3.LocalityEndpointDiscoveryService.Service
end