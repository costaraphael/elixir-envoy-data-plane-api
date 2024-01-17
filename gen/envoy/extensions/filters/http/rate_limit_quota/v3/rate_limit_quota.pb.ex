defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaFilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rlqs_server, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "rlqsServer",
    deprecated: false

  field :domain, 2, type: :string, deprecated: false

  field :bucket_matchers, 3,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "bucketMatchers",
    deprecated: false

  field :filter_enabled, 4,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :filter_enforced, 5,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnforced"

  field :request_headers_to_add_when_not_enforced, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAddWhenNotEnforced",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaOverride do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :domain, 1, type: :string
  field :bucket_matchers, 2, type: Xds.Type.Matcher.V3.Matcher, json_name: "bucketMatchers"
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.NoAssignmentBehavior do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :no_assignment_behavior, 0

  field :fallback_rate_limit, 1,
    type: Envoy.Type.V3.RateLimitStrategy,
    json_name: "fallbackRateLimit",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior.ReuseLastAssignment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :expired_assignment_behavior, 0

  field :expired_assignment_behavior_timeout, 1,
    type: Google.Protobuf.Duration,
    json_name: "expiredAssignmentBehaviorTimeout",
    deprecated: false

  field :fallback_rate_limit, 2,
    type: Envoy.Type.V3.RateLimitStrategy,
    json_name: "fallbackRateLimit",
    oneof: 0

  field :reuse_last_assignment, 3,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior.ReuseLastAssignment,
    json_name: "reuseLastAssignment",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.DenyResponseSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_status, 1, type: Envoy.Type.V3.HttpStatus, json_name: "httpStatus"
  field :http_body, 2, type: Google.Protobuf.BytesValue, json_name: "httpBody"
  field :grpc_status, 3, type: Google.Rpc.Status, json_name: "grpcStatus"

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.ValueBuilder do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value_specifier, 0

  field :string_value, 1, type: :string, json_name: "stringValue", oneof: 0

  field :custom_value, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customValue",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.BucketIdBuilderEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string

  field :value, 2,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.ValueBuilder
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bucket_id_builder, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.BucketIdBuilderEntry,
    json_name: "bucketIdBuilder",
    map: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bucket_id_builder, 1,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder,
    json_name: "bucketIdBuilder"

  field :reporting_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "reportingInterval",
    deprecated: false

  field :deny_response_settings, 3,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.DenyResponseSettings,
    json_name: "denyResponseSettings"

  field :no_assignment_behavior, 4,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.NoAssignmentBehavior,
    json_name: "noAssignmentBehavior"

  field :expired_assignment_behavior, 5,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior,
    json_name: "expiredAssignmentBehavior"
end