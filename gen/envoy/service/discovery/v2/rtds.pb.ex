defmodule Envoy.Service.Discovery.V2.RtdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Discovery.V2.Runtime do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :layer, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.Discovery.V2.RuntimeDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.discovery.v2.RuntimeDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamRuntime,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaRuntime,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchRuntime, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Service.Discovery.V2.RuntimeDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.RuntimeDiscoveryService.Service
end