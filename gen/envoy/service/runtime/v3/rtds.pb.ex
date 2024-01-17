defmodule Envoy.Service.Runtime.V3.RtdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Runtime.V3.Runtime do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :layer, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.Runtime.V3.RuntimeDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.runtime.v3.RuntimeDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamRuntime,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaRuntime,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchRuntime,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Runtime.V3.RuntimeDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Runtime.V3.RuntimeDiscoveryService.Service
end