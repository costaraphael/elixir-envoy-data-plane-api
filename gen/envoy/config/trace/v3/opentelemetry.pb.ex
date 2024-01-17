defmodule Envoy.Config.Trace.V3.OpenTelemetryConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :http_service, 3,
    type: Envoy.Config.Core.V3.HttpService,
    json_name: "httpService",
    deprecated: false

  field :service_name, 2, type: :string, json_name: "serviceName"

  field :resource_detectors, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "resourceDetectors"

  field :sampler, 5, type: Envoy.Config.Core.V3.TypedExtensionConfig
end