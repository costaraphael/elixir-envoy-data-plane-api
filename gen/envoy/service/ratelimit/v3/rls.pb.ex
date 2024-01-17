defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.Code do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :OK, 1
  field :OVER_LIMIT, 2
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit.Unit do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :SECOND, 1
  field :MINUTE, 2
  field :HOUR, 3
  field :DAY, 4
  field :MONTH, 5
  field :YEAR, 6
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :domain, 1, type: :string

  field :descriptors, 2,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor

  field :hits_addend, 3, type: :uint32, json_name: "hitsAddend"
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 3, type: :string
  field :requests_per_unit, 1, type: :uint32, json_name: "requestsPerUnit"
  field :unit, 2, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit.Unit, enum: true
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.Quota do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :expiration_specifier, 0

  field :requests, 1, type: :uint32, deprecated: false
  field :valid_until, 2, type: Google.Protobuf.Timestamp, json_name: "validUntil", oneof: 0
  field :id, 3, type: :string
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.DescriptorStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :code, 1, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Code, enum: true

  field :current_limit, 2,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit,
    json_name: "currentLimit"

  field :limit_remaining, 3, type: :uint32, json_name: "limitRemaining"
  field :duration_until_reset, 4, type: Google.Protobuf.Duration, json_name: "durationUntilReset"
  field :quota, 5, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Quota
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :overall_code, 1,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Code,
    json_name: "overallCode",
    enum: true

  field :statuses, 2,
    repeated: true,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.DescriptorStatus

  field :response_headers_to_add, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "responseHeadersToAdd"

  field :request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "requestHeadersToAdd"

  field :raw_body, 5, type: :bytes, json_name: "rawBody"
  field :dynamic_metadata, 6, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"
  field :quota, 7, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Quota
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitService.Service do
  use GRPC.Service,
    name: "envoy.service.ratelimit.v3.RateLimitService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :ShouldRateLimit,
      Envoy.Service.Ratelimit.V3.RateLimitRequest,
      Envoy.Service.Ratelimit.V3.RateLimitResponse
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitService.Stub do
  use GRPC.Stub, service: Envoy.Service.Ratelimit.V3.RateLimitService.Service
end