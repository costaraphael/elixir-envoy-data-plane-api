defmodule Envoy.Extensions.Filters.Network.Ratelimit.V3.RateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :domain, 2, type: :string, deprecated: false

  field :descriptors, 3,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor,
    deprecated: false

  field :timeout, 4, type: Google.Protobuf.Duration
  field :failure_mode_deny, 5, type: :bool, json_name: "failureModeDeny"

  field :rate_limit_service, 6,
    type: Envoy.Config.Ratelimit.V3.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false
end