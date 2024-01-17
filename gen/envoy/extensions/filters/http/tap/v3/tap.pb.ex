defmodule Envoy.Extensions.Filters.Http.Tap.V3.Tap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false

  field :record_headers_received_time, 2, type: :bool, json_name: "recordHeadersReceivedTime"
  field :record_downstream_connection, 3, type: :bool, json_name: "recordDownstreamConnection"
end