defmodule Envoy.Api.V2.LdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.ListenerDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.api.v2.ListenerDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaListeners,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :StreamListeners,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :FetchListeners, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.ListenerDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.ListenerDiscoveryService.Service
end