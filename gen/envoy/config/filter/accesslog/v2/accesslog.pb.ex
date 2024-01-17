defmodule Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.Op do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :EQ, 0
  field :GE, 1
  field :LE, 2
end

defmodule Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter.Status do
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

defmodule Envoy.Config.Filter.Accesslog.V2.AccessLog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string
  field :filter, 2, type: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter
  field :config, 3, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Filter.Accesslog.V2.AccessLogFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :filter_specifier, 0

  field :status_code_filter, 1,
    type: Envoy.Config.Filter.Accesslog.V2.StatusCodeFilter,
    json_name: "statusCodeFilter",
    oneof: 0

  field :duration_filter, 2,
    type: Envoy.Config.Filter.Accesslog.V2.DurationFilter,
    json_name: "durationFilter",
    oneof: 0

  field :not_health_check_filter, 3,
    type: Envoy.Config.Filter.Accesslog.V2.NotHealthCheckFilter,
    json_name: "notHealthCheckFilter",
    oneof: 0

  field :traceable_filter, 4,
    type: Envoy.Config.Filter.Accesslog.V2.TraceableFilter,
    json_name: "traceableFilter",
    oneof: 0

  field :runtime_filter, 5,
    type: Envoy.Config.Filter.Accesslog.V2.RuntimeFilter,
    json_name: "runtimeFilter",
    oneof: 0

  field :and_filter, 6,
    type: Envoy.Config.Filter.Accesslog.V2.AndFilter,
    json_name: "andFilter",
    oneof: 0

  field :or_filter, 7,
    type: Envoy.Config.Filter.Accesslog.V2.OrFilter,
    json_name: "orFilter",
    oneof: 0

  field :header_filter, 8,
    type: Envoy.Config.Filter.Accesslog.V2.HeaderFilter,
    json_name: "headerFilter",
    oneof: 0

  field :response_flag_filter, 9,
    type: Envoy.Config.Filter.Accesslog.V2.ResponseFlagFilter,
    json_name: "responseFlagFilter",
    oneof: 0

  field :grpc_status_filter, 10,
    type: Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter,
    json_name: "grpcStatusFilter",
    oneof: 0

  field :extension_filter, 11,
    type: Envoy.Config.Filter.Accesslog.V2.ExtensionFilter,
    json_name: "extensionFilter",
    oneof: 0
end

defmodule Envoy.Config.Filter.Accesslog.V2.ComparisonFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :op, 1,
    type: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.Op,
    enum: true,
    deprecated: false

  field :value, 2, type: Envoy.Api.V2.Core.RuntimeUInt32
end

defmodule Envoy.Config.Filter.Accesslog.V2.StatusCodeFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :comparison, 1, type: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter, deprecated: false
end

defmodule Envoy.Config.Filter.Accesslog.V2.DurationFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :comparison, 1, type: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter, deprecated: false
end

defmodule Envoy.Config.Filter.Accesslog.V2.NotHealthCheckFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Filter.Accesslog.V2.TraceableFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Filter.Accesslog.V2.RuntimeFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :runtime_key, 1, type: :string, json_name: "runtimeKey", deprecated: false
  field :percent_sampled, 2, type: Envoy.Type.FractionalPercent, json_name: "percentSampled"
  field :use_independent_randomness, 3, type: :bool, json_name: "useIndependentRandomness"
end

defmodule Envoy.Config.Filter.Accesslog.V2.AndFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filters, 1,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter,
    deprecated: false
end

defmodule Envoy.Config.Filter.Accesslog.V2.OrFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filters, 2,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter,
    deprecated: false
end

defmodule Envoy.Config.Filter.Accesslog.V2.HeaderFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header, 1, type: Envoy.Api.V2.Route.HeaderMatcher, deprecated: false
end

defmodule Envoy.Config.Filter.Accesslog.V2.ResponseFlagFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :flags, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :statuses, 1,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter.Status,
    enum: true,
    deprecated: false

  field :exclude, 2, type: :bool
end

defmodule Envoy.Config.Filter.Accesslog.V2.ExtensionFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end