defmodule Envoy.Config.Metrics.V3.HistogramEmitMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SUMMARY_AND_HISTOGRAM, 0
  field :SUMMARY, 1
  field :HISTOGRAM, 2
end

defmodule Envoy.Config.Metrics.V3.MetricsServiceConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :transport_api_version, 3,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :report_counters_as_deltas, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "reportCountersAsDeltas"

  field :emit_tags_as_labels, 4, type: :bool, json_name: "emitTagsAsLabels"

  field :histogram_emit_mode, 5,
    type: Envoy.Config.Metrics.V3.HistogramEmitMode,
    json_name: "histogramEmitMode",
    enum: true,
    deprecated: false
end