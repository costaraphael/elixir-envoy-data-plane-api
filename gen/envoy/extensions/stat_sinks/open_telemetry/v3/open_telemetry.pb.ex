defmodule Envoy.Extensions.StatSinks.OpenTelemetry.V3.SinkConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :protocol_specifier, 0

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    oneof: 0,
    deprecated: false

  field :report_counters_as_deltas, 2, type: :bool, json_name: "reportCountersAsDeltas"
  field :report_histograms_as_deltas, 3, type: :bool, json_name: "reportHistogramsAsDeltas"

  field :emit_tags_as_attributes, 4,
    type: Google.Protobuf.BoolValue,
    json_name: "emitTagsAsAttributes"

  field :use_tag_extracted_name, 5,
    type: Google.Protobuf.BoolValue,
    json_name: "useTagExtractedName"

  field :prefix, 6, type: :string
end