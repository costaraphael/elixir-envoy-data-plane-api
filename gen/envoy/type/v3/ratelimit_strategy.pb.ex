defmodule Envoy.Type.V3.RateLimitStrategy.BlanketRule do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALLOW_ALL, 0
  field :DENY_ALL, 1
end

defmodule Envoy.Type.V3.RateLimitStrategy.RequestsPerTimeUnit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requests_per_time_unit, 1, type: :uint64, json_name: "requestsPerTimeUnit"

  field :time_unit, 2,
    type: Envoy.Type.V3.RateLimitUnit,
    json_name: "timeUnit",
    enum: true,
    deprecated: false
end

defmodule Envoy.Type.V3.RateLimitStrategy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :strategy, 0

  field :blanket_rule, 1,
    type: Envoy.Type.V3.RateLimitStrategy.BlanketRule,
    json_name: "blanketRule",
    enum: true,
    oneof: 0,
    deprecated: false

  field :requests_per_time_unit, 2,
    type: Envoy.Type.V3.RateLimitStrategy.RequestsPerTimeUnit,
    json_name: "requestsPerTimeUnit",
    oneof: 0

  field :token_bucket, 3, type: Envoy.Type.V3.TokenBucket, json_name: "tokenBucket", oneof: 0
end