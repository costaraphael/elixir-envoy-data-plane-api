defmodule Envoy.Extensions.Filters.Http.Router.V3.Router.UpstreamAccessLogOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :flush_upstream_log_on_upstream_stream, 1,
    type: :bool,
    json_name: "flushUpstreamLogOnUpstreamStream"

  field :upstream_log_flush_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "upstreamLogFlushInterval",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Router.V3.Router do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dynamic_stats, 1, type: Google.Protobuf.BoolValue, json_name: "dynamicStats"
  field :start_child_span, 2, type: :bool, json_name: "startChildSpan", deprecated: true

  field :upstream_log, 3,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "upstreamLog"

  field :upstream_log_options, 9,
    type: Envoy.Extensions.Filters.Http.Router.V3.Router.UpstreamAccessLogOptions,
    json_name: "upstreamLogOptions"

  field :suppress_envoy_headers, 4, type: :bool, json_name: "suppressEnvoyHeaders"

  field :strict_check_headers, 5,
    repeated: true,
    type: :string,
    json_name: "strictCheckHeaders",
    deprecated: false

  field :respect_expected_rq_timeout, 6, type: :bool, json_name: "respectExpectedRqTimeout"

  field :suppress_grpc_request_failure_code_stats, 7,
    type: :bool,
    json_name: "suppressGrpcRequestFailureCodeStats"

  field :upstream_http_filters, 8,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter,
    json_name: "upstreamHttpFilters"
end