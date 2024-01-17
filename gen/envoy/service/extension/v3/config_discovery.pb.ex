defmodule Envoy.Service.Extension.V3.EcdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Extension.V3.ExtensionConfigDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.extension.v3.ExtensionConfigDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamExtensionConfigs,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaExtensionConfigs,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchExtensionConfigs,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Extension.V3.ExtensionConfigDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Extension.V3.ExtensionConfigDiscoveryService.Service
end