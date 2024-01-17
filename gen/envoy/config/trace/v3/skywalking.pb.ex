defmodule Envoy.Config.Trace.V3.SkyWalkingConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :client_config, 2, type: Envoy.Config.Trace.V3.ClientConfig, json_name: "clientConfig"
end

defmodule Envoy.Config.Trace.V3.ClientConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :backend_token_specifier, 0

  field :service_name, 1, type: :string, json_name: "serviceName"
  field :instance_name, 2, type: :string, json_name: "instanceName"
  field :backend_token, 3, type: :string, json_name: "backendToken", oneof: 0, deprecated: false
  field :max_cache_size, 4, type: Google.Protobuf.UInt32Value, json_name: "maxCacheSize"
end