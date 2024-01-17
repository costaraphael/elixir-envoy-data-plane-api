defmodule Envoy.Type.V3.TokenBucket do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_tokens, 1, type: :uint32, json_name: "maxTokens", deprecated: false

  field :tokens_per_fill, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "tokensPerFill",
    deprecated: false

  field :fill_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "fillInterval",
    deprecated: false
end