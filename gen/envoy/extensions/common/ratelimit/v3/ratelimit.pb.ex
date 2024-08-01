defmodule Envoy.Extensions.Common.Ratelimit.V3.XRateLimitHeadersRFCVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OFF, 0
  field :DRAFT_VERSION_03, 1
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.VhRateLimitsOptions do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OVERRIDE, 0
  field :INCLUDE, 1
  field :IGNORE, 2
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requests_per_unit, 1, type: :uint32, json_name: "requestsPerUnit"
  field :unit, 2, type: Envoy.Type.V3.RateLimitUnit, enum: true, deprecated: false
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entries, 1,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry,
    deprecated: false

  field :limit, 2,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.LocalRateLimitDescriptor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entries, 1,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry,
    deprecated: false

  field :token_bucket, 2,
    type: Envoy.Type.V3.TokenBucket,
    json_name: "tokenBucket",
    deprecated: false
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.LocalClusterRateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end