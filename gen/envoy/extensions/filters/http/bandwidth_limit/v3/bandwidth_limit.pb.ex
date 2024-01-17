defmodule Envoy.Extensions.Filters.Http.BandwidthLimit.V3.BandwidthLimit.EnableMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DISABLED, 0
  field :REQUEST, 1
  field :RESPONSE, 2
  field :REQUEST_AND_RESPONSE, 3
end

defmodule Envoy.Extensions.Filters.Http.BandwidthLimit.V3.BandwidthLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :enable_mode, 2,
    type: Envoy.Extensions.Filters.Http.BandwidthLimit.V3.BandwidthLimit.EnableMode,
    json_name: "enableMode",
    enum: true,
    deprecated: false

  field :limit_kbps, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "limitKbps",
    deprecated: false

  field :fill_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "fillInterval",
    deprecated: false

  field :runtime_enabled, 5,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"

  field :enable_response_trailers, 6, type: :bool, json_name: "enableResponseTrailers"

  field :response_trailer_prefix, 7,
    type: :string,
    json_name: "responseTrailerPrefix",
    deprecated: false
end