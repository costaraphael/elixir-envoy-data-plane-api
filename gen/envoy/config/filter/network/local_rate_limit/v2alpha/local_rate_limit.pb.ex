defmodule Envoy.Config.Filter.Network.LocalRateLimit.V2alpha.LocalRateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :token_bucket, 2,
    type: Envoy.Type.TokenBucket,
    json_name: "tokenBucket",
    deprecated: false

  field :runtime_enabled, 3,
    type: Envoy.Api.V2.Core.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end