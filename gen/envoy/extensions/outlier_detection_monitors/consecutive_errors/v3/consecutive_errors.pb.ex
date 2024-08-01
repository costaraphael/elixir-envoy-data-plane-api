defmodule Envoy.Extensions.OutlierDetectionMonitors.ConsecutiveErrors.V3.ConsecutiveErrors do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :threshold, 2, type: Google.Protobuf.UInt32Value, deprecated: false
  field :enforcing, 3, type: Google.Protobuf.UInt32Value, deprecated: false

  field :error_buckets, 4,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.ErrorBuckets,
    json_name: "errorBuckets"
end