defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit.XRateLimitHeadersRFCVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OFF, 0
  field :DRAFT_VERSION_03, 1
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.MetaData.Source do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DYNAMIC, 0
  field :ROUTE_ENTRY, 1
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.VhRateLimitsOptions do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OVERRIDE, 0
  field :INCLUDE, 1
  field :IGNORE, 2
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.OverrideOptions do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :OVERRIDE_POLICY, 1
  field :INCLUDE_POLICY, 2
  field :IGNORE_POLICY, 3
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :domain, 1, type: :string, deprecated: false
  field :stage, 2, type: :uint32, deprecated: false
  field :request_type, 3, type: :string, json_name: "requestType", deprecated: false
  field :timeout, 4, type: Google.Protobuf.Duration
  field :failure_mode_deny, 5, type: :bool, json_name: "failureModeDeny"

  field :rate_limited_as_resource_exhausted, 6,
    type: :bool,
    json_name: "rateLimitedAsResourceExhausted"

  field :rate_limit_service, 7,
    type: Envoy.Config.Ratelimit.V3.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false

  field :enable_x_ratelimit_headers, 8,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit.XRateLimitHeadersRFCVersion,
    json_name: "enableXRatelimitHeaders",
    enum: true,
    deprecated: false

  field :disable_x_envoy_ratelimited_header, 9,
    type: :bool,
    json_name: "disableXEnvoyRatelimitedHeader"

  field :rate_limited_status, 10, type: Envoy.Type.V3.HttpStatus, json_name: "rateLimitedStatus"

  field :response_headers_to_add, 11,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :status_on_error, 12, type: Envoy.Type.V3.HttpStatus, json_name: "statusOnError"
  field :stat_prefix, 13, type: :string, json_name: "statPrefix"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.SourceCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.DestinationCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.RequestHeaders do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey", deprecated: false
  field :skip_if_absent, 3, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.RemoteAddress do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.GenericKey do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.HeaderValueMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :expect_match, 2, type: :bool, json_name: "expectMatch"
  field :headers, 3, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.MetaData do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false

  field :metadata_key, 2,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false

  field :default_value, 3, type: :string, json_name: "defaultValue"

  field :source, 4,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.MetaData.Source,
    enum: true,
    deprecated: false

  field :skip_if_absent, 5, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :action_specifier, 0

  field :source_cluster, 1,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.SourceCluster,
    json_name: "sourceCluster",
    oneof: 0

  field :destination_cluster, 2,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.DestinationCluster,
    json_name: "destinationCluster",
    oneof: 0

  field :request_headers, 3,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.RequestHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :remote_address, 4,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.RemoteAddress,
    json_name: "remoteAddress",
    oneof: 0

  field :generic_key, 5,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.GenericKey,
    json_name: "genericKey",
    oneof: 0

  field :header_value_match, 6,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.HeaderValueMatch,
    json_name: "headerValueMatch",
    oneof: 0

  field :metadata, 8,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action.MetaData,
    oneof: 0

  field :extension, 9, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Override.DynamicMetadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata_key, 1,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Override do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override_specifier, 0

  field :dynamic_metadata, 1,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Override.DynamicMetadata,
    json_name: "dynamicMetadata",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stage, 1, type: :uint32, deprecated: false
  field :disable_key, 2, type: :string, json_name: "disableKey"

  field :actions, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Action,
    deprecated: false

  field :limit, 4, type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig.Override
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :vh_rate_limits, 1,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.VhRateLimitsOptions,
    json_name: "vhRateLimits",
    enum: true,
    deprecated: false

  field :override_option, 2,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.OverrideOptions,
    json_name: "overrideOption",
    enum: true,
    deprecated: false

  field :rate_limits, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitConfig,
    json_name: "rateLimits"

  field :domain, 4, type: :string
end