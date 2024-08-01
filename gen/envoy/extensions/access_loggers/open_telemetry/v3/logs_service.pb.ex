defmodule Envoy.Extensions.AccessLoggers.OpenTelemetry.V3.OpenTelemetryAccessLogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V3.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: false

  field :disable_builtin_labels, 5, type: :bool, json_name: "disableBuiltinLabels"

  field :resource_attributes, 4,
    type: Opentelemetry.Proto.Common.V1.KeyValueList,
    json_name: "resourceAttributes"

  field :body, 2, type: Opentelemetry.Proto.Common.V1.AnyValue
  field :attributes, 3, type: Opentelemetry.Proto.Common.V1.KeyValueList
  field :stat_prefix, 6, type: :string, json_name: "statPrefix"
  field :formatters, 7, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
end