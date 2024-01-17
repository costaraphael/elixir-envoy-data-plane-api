defmodule Envoy.Api.V2.Core.EventServiceConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_source_specifier, 0

  field :grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService, json_name: "grpcService", oneof: 0
end