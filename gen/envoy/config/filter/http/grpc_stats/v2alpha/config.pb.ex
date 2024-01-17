defmodule Envoy.Config.Filter.Http.GrpcStats.V2alpha.FilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :per_method_stat_specifier, 0

  field :emit_filter_state, 1, type: :bool, json_name: "emitFilterState"

  field :individual_method_stats_allowlist, 2,
    type: Envoy.Api.V2.Core.GrpcMethodList,
    json_name: "individualMethodStatsAllowlist",
    oneof: 0

  field :stats_for_all_methods, 3,
    type: Google.Protobuf.BoolValue,
    json_name: "statsForAllMethods",
    oneof: 0
end

defmodule Envoy.Config.Filter.Http.GrpcStats.V2alpha.FilterObject do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_message_count, 1, type: :uint64, json_name: "requestMessageCount"
  field :response_message_count, 2, type: :uint64, json_name: "responseMessageCount"
end