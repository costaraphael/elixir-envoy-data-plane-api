defmodule Envoy.Config.Accesslog.V3.ComparisonFilter.Op do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :EQ, 0
  field :GE, 1
  field :LE, 2
end

defmodule Envoy.Config.Accesslog.V3.GrpcStatusFilter.Status do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OK, 0
  field :CANCELED, 1
  field :UNKNOWN, 2
  field :INVALID_ARGUMENT, 3
  field :DEADLINE_EXCEEDED, 4
  field :NOT_FOUND, 5
  field :ALREADY_EXISTS, 6
  field :PERMISSION_DENIED, 7
  field :RESOURCE_EXHAUSTED, 8
  field :FAILED_PRECONDITION, 9
  field :ABORTED, 10
  field :OUT_OF_RANGE, 11
  field :UNIMPLEMENTED, 12
  field :INTERNAL, 13
  field :UNAVAILABLE, 14
  field :DATA_LOSS, 15
  field :UNAUTHENTICATED, 16
end

defmodule Envoy.Config.Accesslog.V3.AccessLog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string
  field :filter, 2, type: Envoy.Config.Accesslog.V3.AccessLogFilter
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Accesslog.V3.AccessLogFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :filter_specifier, 0

  field :status_code_filter, 1,
    type: Envoy.Config.Accesslog.V3.StatusCodeFilter,
    json_name: "statusCodeFilter",
    oneof: 0

  field :duration_filter, 2,
    type: Envoy.Config.Accesslog.V3.DurationFilter,
    json_name: "durationFilter",
    oneof: 0

  field :not_health_check_filter, 3,
    type: Envoy.Config.Accesslog.V3.NotHealthCheckFilter,
    json_name: "notHealthCheckFilter",
    oneof: 0

  field :traceable_filter, 4,
    type: Envoy.Config.Accesslog.V3.TraceableFilter,
    json_name: "traceableFilter",
    oneof: 0

  field :runtime_filter, 5,
    type: Envoy.Config.Accesslog.V3.RuntimeFilter,
    json_name: "runtimeFilter",
    oneof: 0

  field :and_filter, 6,
    type: Envoy.Config.Accesslog.V3.AndFilter,
    json_name: "andFilter",
    oneof: 0

  field :or_filter, 7, type: Envoy.Config.Accesslog.V3.OrFilter, json_name: "orFilter", oneof: 0

  field :header_filter, 8,
    type: Envoy.Config.Accesslog.V3.HeaderFilter,
    json_name: "headerFilter",
    oneof: 0

  field :response_flag_filter, 9,
    type: Envoy.Config.Accesslog.V3.ResponseFlagFilter,
    json_name: "responseFlagFilter",
    oneof: 0

  field :grpc_status_filter, 10,
    type: Envoy.Config.Accesslog.V3.GrpcStatusFilter,
    json_name: "grpcStatusFilter",
    oneof: 0

  field :extension_filter, 11,
    type: Envoy.Config.Accesslog.V3.ExtensionFilter,
    json_name: "extensionFilter",
    oneof: 0

  field :metadata_filter, 12,
    type: Envoy.Config.Accesslog.V3.MetadataFilter,
    json_name: "metadataFilter",
    oneof: 0

  field :log_type_filter, 13,
    type: Envoy.Config.Accesslog.V3.LogTypeFilter,
    json_name: "logTypeFilter",
    oneof: 0
end

defmodule Envoy.Config.Accesslog.V3.ComparisonFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :op, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter.Op, enum: true, deprecated: false
  field :value, 2, type: Envoy.Config.Core.V3.RuntimeUInt32, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.StatusCodeFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :comparison, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.DurationFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :comparison, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.NotHealthCheckFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Accesslog.V3.TraceableFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Accesslog.V3.RuntimeFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :runtime_key, 1, type: :string, json_name: "runtimeKey", deprecated: false
  field :percent_sampled, 2, type: Envoy.Type.V3.FractionalPercent, json_name: "percentSampled"
  field :use_independent_randomness, 3, type: :bool, json_name: "useIndependentRandomness"
end

defmodule Envoy.Config.Accesslog.V3.AndFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filters, 1,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLogFilter,
    deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.OrFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filters, 2,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLogFilter,
    deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.HeaderFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header, 1, type: Envoy.Config.Route.V3.HeaderMatcher, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.ResponseFlagFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :flags, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.GrpcStatusFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :statuses, 1,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.GrpcStatusFilter.Status,
    enum: true,
    deprecated: false

  field :exclude, 2, type: :bool
end

defmodule Envoy.Config.Accesslog.V3.MetadataFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :matcher, 1, type: Envoy.Type.Matcher.V3.MetadataMatcher

  field :match_if_key_not_found, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "matchIfKeyNotFound"
end

defmodule Envoy.Config.Accesslog.V3.LogTypeFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :types, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.AccessLogType,
    enum: true,
    deprecated: false

  field :exclude, 2, type: :bool
end

defmodule Envoy.Config.Accesslog.V3.ExtensionFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end