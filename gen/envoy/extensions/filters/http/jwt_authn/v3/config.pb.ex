defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider.NormalizePayload do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :space_delimited_claims, 1,
    repeated: true,
    type: :string,
    json_name: "spaceDelimitedClaims"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :jwks_source_specifier, 0

  field :issuer, 1, type: :string
  field :audiences, 2, repeated: true, type: :string
  field :subjects, 19, type: Envoy.Type.Matcher.V3.StringMatcher
  field :require_expiration, 20, type: :bool, json_name: "requireExpiration"
  field :max_lifetime, 21, type: Google.Protobuf.Duration, json_name: "maxLifetime"

  field :remote_jwks, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.RemoteJwks,
    json_name: "remoteJwks",
    oneof: 0

  field :local_jwks, 4, type: Envoy.Config.Core.V3.DataSource, json_name: "localJwks", oneof: 0
  field :forward, 5, type: :bool

  field :from_headers, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtHeader,
    json_name: "fromHeaders"

  field :from_params, 7, repeated: true, type: :string, json_name: "fromParams"
  field :from_cookies, 13, repeated: true, type: :string, json_name: "fromCookies"

  field :forward_payload_header, 8,
    type: :string,
    json_name: "forwardPayloadHeader",
    deprecated: false

  field :pad_forward_payload_header, 11, type: :bool, json_name: "padForwardPayloadHeader"
  field :payload_in_metadata, 9, type: :string, json_name: "payloadInMetadata"

  field :normalize_payload_in_metadata, 18,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider.NormalizePayload,
    json_name: "normalizePayloadInMetadata"

  field :header_in_metadata, 14, type: :string, json_name: "headerInMetadata"
  field :failed_status_in_metadata, 16, type: :string, json_name: "failedStatusInMetadata"
  field :clock_skew_seconds, 10, type: :uint32, json_name: "clockSkewSeconds"

  field :jwt_cache_config, 12,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtCacheConfig,
    json_name: "jwtCacheConfig"

  field :claim_to_headers, 15,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtClaimToHeader,
    json_name: "claimToHeaders"

  field :clear_route_cache, 17, type: :bool, json_name: "clearRouteCache"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtCacheConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :jwt_cache_size, 1, type: :uint32, json_name: "jwtCacheSize"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.RemoteJwks do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: false

  field :cache_duration, 2,
    type: Google.Protobuf.Duration,
    json_name: "cacheDuration",
    deprecated: false

  field :async_fetch, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwksAsyncFetch,
    json_name: "asyncFetch"

  field :retry_policy, 4, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwksAsyncFetch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :fast_listener, 1, type: :bool, json_name: "fastListener"

  field :failed_refetch_duration, 2,
    type: Google.Protobuf.Duration,
    json_name: "failedRefetchDuration"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtHeader do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :value_prefix, 2, type: :string, json_name: "valuePrefix", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.ProviderWithAudiences do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :provider_name, 1, type: :string, json_name: "providerName"
  field :audiences, 2, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :requires_type, 0

  field :provider_name, 1, type: :string, json_name: "providerName", oneof: 0

  field :provider_and_audiences, 2,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.ProviderWithAudiences,
    json_name: "providerAndAudiences",
    oneof: 0

  field :requires_any, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementOrList,
    json_name: "requiresAny",
    oneof: 0

  field :requires_all, 4,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementAndList,
    json_name: "requiresAll",
    oneof: 0

  field :allow_missing_or_failed, 5,
    type: Google.Protobuf.Empty,
    json_name: "allowMissingOrFailed",
    oneof: 0

  field :allow_missing, 6, type: Google.Protobuf.Empty, json_name: "allowMissing", oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementOrList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementAndList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.RequirementRule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :requirement_type, 0

  field :match, 1, type: Envoy.Config.Route.V3.RouteMatch, deprecated: false
  field :requires, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement, oneof: 0

  field :requirement_name, 3,
    type: :string,
    json_name: "requirementName",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule.RequiresEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :requires, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule.RequiresEntry,
    map: true
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.ProvidersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.RequirementMapEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :providers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.ProvidersEntry,
    map: true

  field :rules, 2, repeated: true, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.RequirementRule

  field :filter_state_rules, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule,
    json_name: "filterStateRules"

  field :bypass_cors_preflight, 4, type: :bool, json_name: "bypassCorsPreflight"

  field :requirement_map, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.RequirementMapEntry,
    json_name: "requirementMap",
    map: true

  field :strip_failure_response, 6, type: :bool, json_name: "stripFailureResponse"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.PerRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :requirement_specifier, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :requirement_name, 2,
    type: :string,
    json_name: "requirementName",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtClaimToHeader do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
  field :claim_name, 2, type: :string, json_name: "claimName", deprecated: false
end