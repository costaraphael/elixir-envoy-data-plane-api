defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports.BucketQuotaUsage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bucket_id, 1,
    type: Envoy.Service.RateLimitQuota.V3.BucketId,
    json_name: "bucketId",
    deprecated: false

  field :time_elapsed, 2,
    type: Google.Protobuf.Duration,
    json_name: "timeElapsed",
    deprecated: false

  field :num_requests_allowed, 3, type: :uint64, json_name: "numRequestsAllowed"
  field :num_requests_denied, 4, type: :uint64, json_name: "numRequestsDenied"
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :domain, 1, type: :string, deprecated: false

  field :bucket_quota_usages, 2,
    repeated: true,
    type: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports.BucketQuotaUsage,
    json_name: "bucketQuotaUsages",
    deprecated: false
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :assignment_time_to_live, 2,
    type: Google.Protobuf.Duration,
    json_name: "assignmentTimeToLive",
    deprecated: false

  field :rate_limit_strategy, 3,
    type: Envoy.Type.V3.RateLimitStrategy,
    json_name: "rateLimitStrategy"
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.AbandonAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :bucket_action, 0

  field :bucket_id, 1,
    type: Envoy.Service.RateLimitQuota.V3.BucketId,
    json_name: "bucketId",
    deprecated: false

  field :quota_assignment_action, 2,
    type:
      Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction,
    json_name: "quotaAssignmentAction",
    oneof: 0

  field :abandon_action, 3,
    type: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.AbandonAction,
    json_name: "abandonAction",
    oneof: 0
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bucket_action, 1,
    repeated: true,
    type: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction,
    json_name: "bucketAction",
    deprecated: false
end

defmodule Envoy.Service.RateLimitQuota.V3.BucketId.BucketEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.RateLimitQuota.V3.BucketId do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bucket, 1,
    repeated: true,
    type: Envoy.Service.RateLimitQuota.V3.BucketId.BucketEntry,
    map: true,
    deprecated: false
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaService.Service do
  use GRPC.Service,
    name: "envoy.service.rate_limit_quota.v3.RateLimitQuotaService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamRateLimitQuotas,
      stream(Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports),
      stream(Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse)
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaService.Stub do
  use GRPC.Stub, service: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaService.Service
end