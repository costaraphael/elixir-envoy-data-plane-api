defmodule Envoy.Extensions.Filters.Http.Fault.V3.FaultAbort.HeaderAbort do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Fault.V3.FaultAbort do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :error_type, 0

  field :http_status, 2, type: :uint32, json_name: "httpStatus", oneof: 0, deprecated: false
  field :grpc_status, 5, type: :uint32, json_name: "grpcStatus", oneof: 0

  field :header_abort, 4,
    type: Envoy.Extensions.Filters.Http.Fault.V3.FaultAbort.HeaderAbort,
    json_name: "headerAbort",
    oneof: 0

  field :percentage, 3, type: Envoy.Type.V3.FractionalPercent
end

defmodule Envoy.Extensions.Filters.Http.Fault.V3.HTTPFault do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :delay, 1, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay
  field :abort, 2, type: Envoy.Extensions.Filters.Http.Fault.V3.FaultAbort
  field :upstream_cluster, 3, type: :string, json_name: "upstreamCluster"
  field :headers, 4, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
  field :downstream_nodes, 5, repeated: true, type: :string, json_name: "downstreamNodes"
  field :max_active_faults, 6, type: Google.Protobuf.UInt32Value, json_name: "maxActiveFaults"

  field :response_rate_limit, 7,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit,
    json_name: "responseRateLimit"

  field :delay_percent_runtime, 8, type: :string, json_name: "delayPercentRuntime"
  field :abort_percent_runtime, 9, type: :string, json_name: "abortPercentRuntime"
  field :delay_duration_runtime, 10, type: :string, json_name: "delayDurationRuntime"
  field :abort_http_status_runtime, 11, type: :string, json_name: "abortHttpStatusRuntime"
  field :max_active_faults_runtime, 12, type: :string, json_name: "maxActiveFaultsRuntime"

  field :response_rate_limit_percent_runtime, 13,
    type: :string,
    json_name: "responseRateLimitPercentRuntime"

  field :abort_grpc_status_runtime, 14, type: :string, json_name: "abortGrpcStatusRuntime"

  field :disable_downstream_cluster_stats, 15,
    type: :bool,
    json_name: "disableDownstreamClusterStats"

  field :filter_metadata, 16, type: Google.Protobuf.Struct, json_name: "filterMetadata"
end