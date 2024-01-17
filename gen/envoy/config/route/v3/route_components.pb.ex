defmodule Envoy.Config.Route.V3.VirtualHost.TlsRequirementType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NONE, 0
  field :EXTERNAL_ONLY, 1
  field :ALL, 2
end

defmodule Envoy.Config.Route.V3.RouteAction.ClusterNotFoundResponseCode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SERVICE_UNAVAILABLE, 0
  field :NOT_FOUND, 1
  field :INTERNAL_SERVER_ERROR, 2
end

defmodule Envoy.Config.Route.V3.RouteAction.InternalRedirectAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :PASS_THROUGH_INTERNAL_REDIRECT, 0
  field :HANDLE_INTERNAL_REDIRECT, 1
end

defmodule Envoy.Config.Route.V3.RetryPolicy.ResetHeaderFormat do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SECONDS, 0
  field :UNIX_TIMESTAMP, 1
end

defmodule Envoy.Config.Route.V3.RedirectAction.RedirectResponseCode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :MOVED_PERMANENTLY, 0
  field :FOUND, 1
  field :SEE_OTHER, 2
  field :TEMPORARY_REDIRECT, 3
  field :PERMANENT_REDIRECT, 4
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.MetaData.Source do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DYNAMIC, 0
  field :ROUTE_ENTRY, 1
end

defmodule Envoy.Config.Route.V3.VirtualHost.TypedPerFilterConfigEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.VirtualHost do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :domains, 2, repeated: true, type: :string, deprecated: false
  field :routes, 3, repeated: true, type: Envoy.Config.Route.V3.Route
  field :matcher, 21, type: Xds.Type.Matcher.V3.Matcher, deprecated: false

  field :require_tls, 4,
    type: Envoy.Config.Route.V3.VirtualHost.TlsRequirementType,
    json_name: "requireTls",
    enum: true,
    deprecated: false

  field :virtual_clusters, 5,
    repeated: true,
    type: Envoy.Config.Route.V3.VirtualCluster,
    json_name: "virtualClusters"

  field :rate_limits, 6,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :request_headers_to_add, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 13,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 11,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :cors, 8, type: Envoy.Config.Route.V3.CorsPolicy, deprecated: true

  field :typed_per_filter_config, 15,
    repeated: true,
    type: Envoy.Config.Route.V3.VirtualHost.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :include_request_attempt_count, 14, type: :bool, json_name: "includeRequestAttemptCount"

  field :include_attempt_count_in_response, 19,
    type: :bool,
    json_name: "includeAttemptCountInResponse"

  field :retry_policy, 16, type: Envoy.Config.Route.V3.RetryPolicy, json_name: "retryPolicy"

  field :retry_policy_typed_config, 20,
    type: Google.Protobuf.Any,
    json_name: "retryPolicyTypedConfig"

  field :hedge_policy, 17, type: Envoy.Config.Route.V3.HedgePolicy, json_name: "hedgePolicy"

  field :include_is_timeout_retry_header, 23,
    type: :bool,
    json_name: "includeIsTimeoutRetryHeader"

  field :per_request_buffer_limit_bytes, 18,
    type: Google.Protobuf.UInt32Value,
    json_name: "perRequestBufferLimitBytes"

  field :request_mirror_policies, 22,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :metadata, 24, type: Envoy.Config.Core.V3.Metadata
end

defmodule Envoy.Config.Route.V3.FilterAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :action, 1, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.RouteList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :routes, 1, repeated: true, type: Envoy.Config.Route.V3.Route
end

defmodule Envoy.Config.Route.V3.Route.TypedPerFilterConfigEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.Route do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :action, 0

  field :name, 14, type: :string
  field :match, 1, type: Envoy.Config.Route.V3.RouteMatch, deprecated: false
  field :route, 2, type: Envoy.Config.Route.V3.RouteAction, oneof: 0
  field :redirect, 3, type: Envoy.Config.Route.V3.RedirectAction, oneof: 0

  field :direct_response, 7,
    type: Envoy.Config.Route.V3.DirectResponseAction,
    json_name: "directResponse",
    oneof: 0

  field :filter_action, 17,
    type: Envoy.Config.Route.V3.FilterAction,
    json_name: "filterAction",
    oneof: 0

  field :non_forwarding_action, 18,
    type: Envoy.Config.Route.V3.NonForwardingAction,
    json_name: "nonForwardingAction",
    oneof: 0

  field :metadata, 4, type: Envoy.Config.Core.V3.Metadata
  field :decorator, 5, type: Envoy.Config.Route.V3.Decorator

  field :typed_per_filter_config, 13,
    repeated: true,
    type: Envoy.Config.Route.V3.Route.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :request_headers_to_add, 9,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 12,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 11,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :tracing, 15, type: Envoy.Config.Route.V3.Tracing

  field :per_request_buffer_limit_bytes, 16,
    type: Google.Protobuf.UInt32Value,
    json_name: "perRequestBufferLimitBytes"

  field :stat_prefix, 19, type: :string, json_name: "statPrefix"
end

defmodule Envoy.Config.Route.V3.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.WeightedCluster.ClusterWeight do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :host_rewrite_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :cluster_header, 12, type: :string, json_name: "clusterHeader", deprecated: false
  field :weight, 2, type: Google.Protobuf.UInt32Value
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"

  field :request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 9,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :response_headers_to_add, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 6,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :typed_per_filter_config, 10,
    repeated: true,
    type: Envoy.Config.Route.V3.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :host_rewrite_literal, 11,
    type: :string,
    json_name: "hostRewriteLiteral",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Config.Route.V3.WeightedCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :random_value_specifier, 0

  field :clusters, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.WeightedCluster.ClusterWeight,
    deprecated: false

  field :total_weight, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "totalWeight",
    deprecated: true

  field :runtime_key_prefix, 2, type: :string, json_name: "runtimeKeyPrefix"
  field :header_name, 4, type: :string, json_name: "headerName", oneof: 0, deprecated: false
end

defmodule Envoy.Config.Route.V3.ClusterSpecifierPlugin do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :extension, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
  field :is_optional, 2, type: :bool, json_name: "isOptional"
end

defmodule Envoy.Config.Route.V3.RouteMatch.GrpcRouteMatchOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Route.V3.RouteMatch.TlsContextMatchOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :presented, 1, type: Google.Protobuf.BoolValue
  field :validated, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Config.Route.V3.RouteMatch.ConnectMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Route.V3.RouteMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :path_specifier, 0

  field :prefix, 1, type: :string, oneof: 0
  field :path, 2, type: :string, oneof: 0

  field :safe_regex, 10,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "safeRegex",
    oneof: 0,
    deprecated: false

  field :connect_matcher, 12,
    type: Envoy.Config.Route.V3.RouteMatch.ConnectMatcher,
    json_name: "connectMatcher",
    oneof: 0

  field :path_separated_prefix, 14,
    type: :string,
    json_name: "pathSeparatedPrefix",
    oneof: 0,
    deprecated: false

  field :path_match_policy, 15,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "pathMatchPolicy",
    oneof: 0

  field :case_sensitive, 4, type: Google.Protobuf.BoolValue, json_name: "caseSensitive"

  field :runtime_fraction, 9,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :headers, 6, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher

  field :query_parameters, 7,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher,
    json_name: "queryParameters"

  field :grpc, 8, type: Envoy.Config.Route.V3.RouteMatch.GrpcRouteMatchOptions

  field :tls_context, 11,
    type: Envoy.Config.Route.V3.RouteMatch.TlsContextMatchOptions,
    json_name: "tlsContext"

  field :dynamic_metadata, 13,
    repeated: true,
    type: Envoy.Type.Matcher.V3.MetadataMatcher,
    json_name: "dynamicMetadata"
end

defmodule Envoy.Config.Route.V3.CorsPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :enabled_specifier, 0

  field :allow_origin_string_match, 11,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "allowOriginStringMatch"

  field :allow_methods, 2, type: :string, json_name: "allowMethods"
  field :allow_headers, 3, type: :string, json_name: "allowHeaders"
  field :expose_headers, 4, type: :string, json_name: "exposeHeaders"
  field :max_age, 5, type: :string, json_name: "maxAge"
  field :allow_credentials, 6, type: Google.Protobuf.BoolValue, json_name: "allowCredentials"

  field :filter_enabled, 9,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    oneof: 0

  field :shadow_enabled, 10,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :allow_private_network_access, 12,
    type: Google.Protobuf.BoolValue,
    json_name: "allowPrivateNetworkAccess"
end

defmodule Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false
  field :cluster_header, 5, type: :string, json_name: "clusterHeader", deprecated: false

  field :runtime_fraction, 3,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :trace_sampled, 4, type: Google.Protobuf.BoolValue, json_name: "traceSampled"
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.Header do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false

  field :regex_rewrite, 2,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexRewrite"
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.CookieAttribute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.Cookie do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :ttl, 2, type: Google.Protobuf.Duration
  field :path, 3, type: :string

  field :attributes, 4,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.CookieAttribute
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.ConnectionProperties do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :source_ip, 1, type: :bool, json_name: "sourceIp"
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.QueryParameter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.FilterState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :policy_specifier, 0

  field :header, 1, type: Envoy.Config.Route.V3.RouteAction.HashPolicy.Header, oneof: 0
  field :cookie, 2, type: Envoy.Config.Route.V3.RouteAction.HashPolicy.Cookie, oneof: 0

  field :connection_properties, 3,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.ConnectionProperties,
    json_name: "connectionProperties",
    oneof: 0

  field :query_parameter, 5,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.QueryParameter,
    json_name: "queryParameter",
    oneof: 0

  field :filter_state, 6,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.FilterState,
    json_name: "filterState",
    oneof: 0

  field :terminal, 4, type: :bool
end

defmodule Envoy.Config.Route.V3.RouteAction.UpgradeConfig.ConnectConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :proxy_protocol_config, 1,
    type: Envoy.Config.Core.V3.ProxyProtocolConfig,
    json_name: "proxyProtocolConfig"

  field :allow_post, 2, type: :bool, json_name: "allowPost"
end

defmodule Envoy.Config.Route.V3.RouteAction.UpgradeConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :upgrade_type, 1, type: :string, json_name: "upgradeType", deprecated: false
  field :enabled, 2, type: Google.Protobuf.BoolValue

  field :connect_config, 3,
    type: Envoy.Config.Route.V3.RouteAction.UpgradeConfig.ConnectConfig,
    json_name: "connectConfig"
end

defmodule Envoy.Config.Route.V3.RouteAction.MaxStreamDuration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_stream_duration, 1, type: Google.Protobuf.Duration, json_name: "maxStreamDuration"

  field :grpc_timeout_header_max, 2,
    type: Google.Protobuf.Duration,
    json_name: "grpcTimeoutHeaderMax"

  field :grpc_timeout_header_offset, 3,
    type: Google.Protobuf.Duration,
    json_name: "grpcTimeoutHeaderOffset"
end

defmodule Envoy.Config.Route.V3.RouteAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :cluster_specifier, 0

  oneof :host_rewrite_specifier, 1

  field :cluster, 1, type: :string, oneof: 0, deprecated: false
  field :cluster_header, 2, type: :string, json_name: "clusterHeader", oneof: 0, deprecated: false

  field :weighted_clusters, 3,
    type: Envoy.Config.Route.V3.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :cluster_specifier_plugin, 37,
    type: :string,
    json_name: "clusterSpecifierPlugin",
    oneof: 0

  field :inline_cluster_specifier_plugin, 39,
    type: Envoy.Config.Route.V3.ClusterSpecifierPlugin,
    json_name: "inlineClusterSpecifierPlugin",
    oneof: 0

  field :cluster_not_found_response_code, 20,
    type: Envoy.Config.Route.V3.RouteAction.ClusterNotFoundResponseCode,
    json_name: "clusterNotFoundResponseCode",
    enum: true,
    deprecated: false

  field :metadata_match, 4, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
  field :prefix_rewrite, 5, type: :string, json_name: "prefixRewrite", deprecated: false

  field :regex_rewrite, 32,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexRewrite"

  field :path_rewrite_policy, 41,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "pathRewritePolicy"

  field :host_rewrite_literal, 6,
    type: :string,
    json_name: "hostRewriteLiteral",
    oneof: 1,
    deprecated: false

  field :auto_host_rewrite, 7,
    type: Google.Protobuf.BoolValue,
    json_name: "autoHostRewrite",
    oneof: 1

  field :host_rewrite_header, 29,
    type: :string,
    json_name: "hostRewriteHeader",
    oneof: 1,
    deprecated: false

  field :host_rewrite_path_regex, 35,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "hostRewritePathRegex",
    oneof: 1

  field :append_x_forwarded_host, 38, type: :bool, json_name: "appendXForwardedHost"
  field :timeout, 8, type: Google.Protobuf.Duration
  field :idle_timeout, 24, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :early_data_policy, 40,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "earlyDataPolicy"

  field :retry_policy, 9, type: Envoy.Config.Route.V3.RetryPolicy, json_name: "retryPolicy"

  field :retry_policy_typed_config, 33,
    type: Google.Protobuf.Any,
    json_name: "retryPolicyTypedConfig"

  field :request_mirror_policies, 30,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :priority, 11, type: Envoy.Config.Core.V3.RoutingPriority, enum: true, deprecated: false

  field :rate_limits, 13,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :include_vh_rate_limits, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "includeVhRateLimits",
    deprecated: true

  field :hash_policy, 15,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy,
    json_name: "hashPolicy"

  field :cors, 17, type: Envoy.Config.Route.V3.CorsPolicy, deprecated: true

  field :max_grpc_timeout, 23,
    type: Google.Protobuf.Duration,
    json_name: "maxGrpcTimeout",
    deprecated: true

  field :grpc_timeout_offset, 28,
    type: Google.Protobuf.Duration,
    json_name: "grpcTimeoutOffset",
    deprecated: true

  field :upgrade_configs, 25,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.UpgradeConfig,
    json_name: "upgradeConfigs"

  field :internal_redirect_policy, 34,
    type: Envoy.Config.Route.V3.InternalRedirectPolicy,
    json_name: "internalRedirectPolicy"

  field :internal_redirect_action, 26,
    type: Envoy.Config.Route.V3.RouteAction.InternalRedirectAction,
    json_name: "internalRedirectAction",
    enum: true,
    deprecated: true

  field :max_internal_redirects, 31,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInternalRedirects",
    deprecated: true

  field :hedge_policy, 27, type: Envoy.Config.Route.V3.HedgePolicy, json_name: "hedgePolicy"

  field :max_stream_duration, 36,
    type: Envoy.Config.Route.V3.RouteAction.MaxStreamDuration,
    json_name: "maxStreamDuration"
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RetryPriority do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RetryHostPredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RetryBackOff do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :base_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "baseInterval",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RetryPolicy.ResetHeader do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :format, 2,
    type: Envoy.Config.Route.V3.RetryPolicy.ResetHeaderFormat,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RateLimitedRetryBackOff do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reset_headers, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.RetryPolicy.ResetHeader,
    json_name: "resetHeaders",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RetryPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :retry_on, 1, type: :string, json_name: "retryOn"

  field :num_retries, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "numRetries",
    deprecated: false

  field :per_try_timeout, 3, type: Google.Protobuf.Duration, json_name: "perTryTimeout"
  field :per_try_idle_timeout, 13, type: Google.Protobuf.Duration, json_name: "perTryIdleTimeout"

  field :retry_priority, 4,
    type: Envoy.Config.Route.V3.RetryPolicy.RetryPriority,
    json_name: "retryPriority"

  field :retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Config.Route.V3.RetryPolicy.RetryHostPredicate,
    json_name: "retryHostPredicate"

  field :retry_options_predicates, 12,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "retryOptionsPredicates"

  field :host_selection_retry_max_attempts, 6,
    type: :int64,
    json_name: "hostSelectionRetryMaxAttempts"

  field :retriable_status_codes, 7,
    repeated: true,
    type: :uint32,
    json_name: "retriableStatusCodes"

  field :retry_back_off, 8,
    type: Envoy.Config.Route.V3.RetryPolicy.RetryBackOff,
    json_name: "retryBackOff"

  field :rate_limited_retry_back_off, 11,
    type: Envoy.Config.Route.V3.RetryPolicy.RateLimitedRetryBackOff,
    json_name: "rateLimitedRetryBackOff"

  field :retriable_headers, 9,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "retriableHeaders"

  field :retriable_request_headers, 10,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "retriableRequestHeaders"
end

defmodule Envoy.Config.Route.V3.HedgePolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :initial_requests, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialRequests",
    deprecated: false

  field :additional_request_chance, 2,
    type: Envoy.Type.V3.FractionalPercent,
    json_name: "additionalRequestChance"

  field :hedge_on_per_try_timeout, 3, type: :bool, json_name: "hedgeOnPerTryTimeout"
end

defmodule Envoy.Config.Route.V3.RedirectAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :scheme_rewrite_specifier, 0

  oneof :path_rewrite_specifier, 1

  field :https_redirect, 4, type: :bool, json_name: "httpsRedirect", oneof: 0
  field :scheme_redirect, 7, type: :string, json_name: "schemeRedirect", oneof: 0
  field :host_redirect, 1, type: :string, json_name: "hostRedirect", deprecated: false
  field :port_redirect, 8, type: :uint32, json_name: "portRedirect"
  field :path_redirect, 2, type: :string, json_name: "pathRedirect", oneof: 1, deprecated: false
  field :prefix_rewrite, 5, type: :string, json_name: "prefixRewrite", oneof: 1, deprecated: false

  field :regex_rewrite, 9,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexRewrite",
    oneof: 1

  field :response_code, 3,
    type: Envoy.Config.Route.V3.RedirectAction.RedirectResponseCode,
    json_name: "responseCode",
    enum: true,
    deprecated: false

  field :strip_query, 6, type: :bool, json_name: "stripQuery"
end

defmodule Envoy.Config.Route.V3.DirectResponseAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: :uint32, deprecated: false
  field :body, 2, type: Envoy.Config.Core.V3.DataSource
end

defmodule Envoy.Config.Route.V3.NonForwardingAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Route.V3.Decorator do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :operation, 1, type: :string, deprecated: false
  field :propagate, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Config.Route.V3.Tracing do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :client_sampling, 1, type: Envoy.Type.V3.FractionalPercent, json_name: "clientSampling"
  field :random_sampling, 2, type: Envoy.Type.V3.FractionalPercent, json_name: "randomSampling"
  field :overall_sampling, 3, type: Envoy.Type.V3.FractionalPercent, json_name: "overallSampling"

  field :custom_tags, 4,
    repeated: true,
    type: Envoy.Type.Tracing.V3.CustomTag,
    json_name: "customTags"
end

defmodule Envoy.Config.Route.V3.VirtualCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 4, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
  field :name, 2, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.SourceCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.DestinationCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.RequestHeaders do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey", deprecated: false
  field :skip_if_absent, 3, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.RemoteAddress do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.MaskedRemoteAddress do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :v4_prefix_mask_len, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "v4PrefixMaskLen",
    deprecated: false

  field :v6_prefix_mask_len, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "v6PrefixMaskLen",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.GenericKey do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.HeaderValueMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_key, 4, type: :string, json_name: "descriptorKey"
  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :expect_match, 2, type: Google.Protobuf.BoolValue, json_name: "expectMatch"
  field :headers, 3, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher, deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.DynamicMetaData do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false

  field :metadata_key, 2,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false

  field :default_value, 3, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.MetaData do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false

  field :metadata_key, 2,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false

  field :default_value, 3, type: :string, json_name: "defaultValue"

  field :source, 4,
    type: Envoy.Config.Route.V3.RateLimit.Action.MetaData.Source,
    enum: true,
    deprecated: false

  field :skip_if_absent, 5, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.QueryParameterValueMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_key, 4, type: :string, json_name: "descriptorKey"
  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :expect_match, 2, type: Google.Protobuf.BoolValue, json_name: "expectMatch"

  field :query_parameters, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher,
    json_name: "queryParameters",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :action_specifier, 0

  field :source_cluster, 1,
    type: Envoy.Config.Route.V3.RateLimit.Action.SourceCluster,
    json_name: "sourceCluster",
    oneof: 0

  field :destination_cluster, 2,
    type: Envoy.Config.Route.V3.RateLimit.Action.DestinationCluster,
    json_name: "destinationCluster",
    oneof: 0

  field :request_headers, 3,
    type: Envoy.Config.Route.V3.RateLimit.Action.RequestHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :remote_address, 4,
    type: Envoy.Config.Route.V3.RateLimit.Action.RemoteAddress,
    json_name: "remoteAddress",
    oneof: 0

  field :generic_key, 5,
    type: Envoy.Config.Route.V3.RateLimit.Action.GenericKey,
    json_name: "genericKey",
    oneof: 0

  field :header_value_match, 6,
    type: Envoy.Config.Route.V3.RateLimit.Action.HeaderValueMatch,
    json_name: "headerValueMatch",
    oneof: 0

  field :dynamic_metadata, 7,
    type: Envoy.Config.Route.V3.RateLimit.Action.DynamicMetaData,
    json_name: "dynamicMetadata",
    oneof: 0,
    deprecated: true

  field :metadata, 8, type: Envoy.Config.Route.V3.RateLimit.Action.MetaData, oneof: 0
  field :extension, 9, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0

  field :masked_remote_address, 10,
    type: Envoy.Config.Route.V3.RateLimit.Action.MaskedRemoteAddress,
    json_name: "maskedRemoteAddress",
    oneof: 0

  field :query_parameter_value_match, 11,
    type: Envoy.Config.Route.V3.RateLimit.Action.QueryParameterValueMatch,
    json_name: "queryParameterValueMatch",
    oneof: 0
end

defmodule Envoy.Config.Route.V3.RateLimit.Override.DynamicMetadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata_key, 1,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Override do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override_specifier, 0

  field :dynamic_metadata, 1,
    type: Envoy.Config.Route.V3.RateLimit.Override.DynamicMetadata,
    json_name: "dynamicMetadata",
    oneof: 0
end

defmodule Envoy.Config.Route.V3.RateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stage, 1, type: Google.Protobuf.UInt32Value, deprecated: false
  field :disable_key, 2, type: :string, json_name: "disableKey"

  field :actions, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit.Action,
    deprecated: false

  field :limit, 4, type: Envoy.Config.Route.V3.RateLimit.Override
end

defmodule Envoy.Config.Route.V3.HeaderMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :header_match_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :exact_match, 4, type: :string, json_name: "exactMatch", oneof: 0, deprecated: true

  field :safe_regex_match, 11,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "safeRegexMatch",
    oneof: 0,
    deprecated: true

  field :range_match, 6, type: Envoy.Type.V3.Int64Range, json_name: "rangeMatch", oneof: 0
  field :present_match, 7, type: :bool, json_name: "presentMatch", oneof: 0
  field :prefix_match, 9, type: :string, json_name: "prefixMatch", oneof: 0, deprecated: true
  field :suffix_match, 10, type: :string, json_name: "suffixMatch", oneof: 0, deprecated: true
  field :contains_match, 12, type: :string, json_name: "containsMatch", oneof: 0, deprecated: true

  field :string_match, 13,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    oneof: 0

  field :invert_match, 8, type: :bool, json_name: "invertMatch"
  field :treat_missing_header_as_empty, 14, type: :bool, json_name: "treatMissingHeaderAsEmpty"
end

defmodule Envoy.Config.Route.V3.QueryParameterMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :query_parameter_match_specifier, 0

  field :name, 1, type: :string, deprecated: false

  field :string_match, 5,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    oneof: 0,
    deprecated: false

  field :present_match, 6, type: :bool, json_name: "presentMatch", oneof: 0
end

defmodule Envoy.Config.Route.V3.InternalRedirectPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_internal_redirects, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInternalRedirects"

  field :redirect_response_codes, 2,
    repeated: true,
    type: :uint32,
    json_name: "redirectResponseCodes",
    deprecated: false

  field :predicates, 3, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
  field :allow_cross_scheme_redirect, 4, type: :bool, json_name: "allowCrossSchemeRedirect"

  field :response_headers_to_copy, 5,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToCopy",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.FilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Google.Protobuf.Any
  field :is_optional, 2, type: :bool, json_name: "isOptional"
  field :disabled, 3, type: :bool
end