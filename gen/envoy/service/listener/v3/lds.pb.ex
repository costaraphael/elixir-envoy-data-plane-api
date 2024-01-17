defmodule Envoy.Service.Listener.V3.LdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Listener.V3.ListenerDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.listener.v3.ListenerDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :DeltaListeners,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :StreamListeners,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :FetchListeners,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Listener.V3.ListenerDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Listener.V3.ListenerDiscoveryService.Service
end