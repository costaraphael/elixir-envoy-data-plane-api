defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.Ratelimit.V3.RateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :domain, 1, type: :string, deprecated: false
  field :stage, 2, type: :uint32, deprecated: false
  field :timeout, 3, type: Google.Protobuf.Duration
  field :failure_mode_deny, 4, type: :bool, json_name: "failureModeDeny"

  field :rate_limit_service, 5,
    type: Envoy.Config.Ratelimit.V3.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false
end