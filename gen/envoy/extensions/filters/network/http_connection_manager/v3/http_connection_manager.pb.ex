defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.CodecType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO, 0
  field :HTTP1, 1
  field :HTTP2, 2
  field :HTTP3, 3
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ServerHeaderTransformation do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OVERWRITE, 0
  field :APPEND_IF_ABSENT, 1
  field :PASS_THROUGH, 2
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ForwardClientCertDetails do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SANITIZE, 0
  field :FORWARD_ONLY, 1
  field :APPEND_FORWARD, 2
  field :SANITIZE_SET, 3
  field :ALWAYS_FORWARD_ONLY, 4
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.PathWithEscapedSlashesAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :IMPLEMENTATION_SPECIFIC_DEFAULT, 0
  field :KEEP_UNCHANGED, 1
  field :REJECT_REQUEST, 2
  field :UNESCAPE_AND_REDIRECT, 3
  field :UNESCAPE_AND_FORWARD, 4
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing.OperationName do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :INGRESS, 0
  field :EGRESS, 1
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :client_sampling, 3, type: Envoy.Type.V3.Percent, json_name: "clientSampling"
  field :random_sampling, 4, type: Envoy.Type.V3.Percent, json_name: "randomSampling"
  field :overall_sampling, 5, type: Envoy.Type.V3.Percent, json_name: "overallSampling"
  field :verbose, 6, type: :bool
  field :max_path_tag_length, 7, type: Google.Protobuf.UInt32Value, json_name: "maxPathTagLength"

  field :custom_tags, 8,
    repeated: true,
    type: Envoy.Type.Tracing.V3.CustomTag,
    json_name: "customTags"

  field :provider, 9, type: Envoy.Config.Trace.V3.Tracing.Http
  field :spawn_upstream_span, 10, type: Google.Protobuf.BoolValue, json_name: "spawnUpstreamSpan"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.InternalAddressConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :unix_sockets, 1, type: :bool, json_name: "unixSockets"

  field :cidr_ranges, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "cidrRanges"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.SetCurrentClientCertDetails do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :subject, 1, type: Google.Protobuf.BoolValue
  field :cert, 3, type: :bool
  field :chain, 6, type: :bool
  field :dns, 4, type: :bool
  field :uri, 5, type: :bool
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.UpgradeConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :upgrade_type, 1, type: :string, json_name: "upgradeType"

  field :filters, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter

  field :enabled, 3, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.PathNormalizationOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :forwarding_transformation, 1,
    type: Envoy.Type.Http.V3.PathTransformation,
    json_name: "forwardingTransformation"

  field :http_filter_transformation, 2,
    type: Envoy.Type.Http.V3.PathTransformation,
    json_name: "httpFilterTransformation"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ProxyStatusConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :proxy_name, 0

  field :remove_details, 1, type: :bool, json_name: "removeDetails"

  field :remove_connection_termination_details, 2,
    type: :bool,
    json_name: "removeConnectionTerminationDetails"

  field :remove_response_flags, 3, type: :bool, json_name: "removeResponseFlags"
  field :set_recommended_response_code, 4, type: :bool, json_name: "setRecommendedResponseCode"
  field :use_node_id, 5, type: :bool, json_name: "useNodeId", oneof: 0
  field :literal_proxy_name, 6, type: :string, json_name: "literalProxyName", oneof: 0
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.HcmAccessLogOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :access_log_flush_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: false

  field :flush_access_log_on_new_request, 2, type: :bool, json_name: "flushAccessLogOnNewRequest"

  field :flush_log_on_tunnel_successfully_established, 3,
    type: :bool,
    json_name: "flushLogOnTunnelSuccessfullyEstablished"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :route_specifier, 0

  oneof :strip_port_mode, 1

  field :codec_type, 1,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.CodecType,
    json_name: "codecType",
    enum: true,
    deprecated: false

  field :stat_prefix, 2, type: :string, json_name: "statPrefix", deprecated: false
  field :rds, 3, type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.Rds, oneof: 0

  field :route_config, 4,
    type: Envoy.Config.Route.V3.RouteConfiguration,
    json_name: "routeConfig",
    oneof: 0

  field :scoped_routes, 31,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes,
    json_name: "scopedRoutes",
    oneof: 0

  field :http_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter,
    json_name: "httpFilters"

  field :add_user_agent, 6, type: Google.Protobuf.BoolValue, json_name: "addUserAgent"

  field :tracing, 7,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing

  field :common_http_protocol_options, 35,
    type: Envoy.Config.Core.V3.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions",
    deprecated: false

  field :http_protocol_options, 8,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 9,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions",
    deprecated: false

  field :http3_protocol_options, 44,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions"

  field :server_name, 10, type: :string, json_name: "serverName", deprecated: false

  field :server_header_transformation, 34,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ServerHeaderTransformation,
    json_name: "serverHeaderTransformation",
    enum: true,
    deprecated: false

  field :scheme_header_transformation, 48,
    type: Envoy.Config.Core.V3.SchemeHeaderTransformation,
    json_name: "schemeHeaderTransformation"

  field :max_request_headers_kb, 29,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestHeadersKb",
    deprecated: false

  field :stream_idle_timeout, 24,
    type: Google.Protobuf.Duration,
    json_name: "streamIdleTimeout",
    deprecated: false

  field :request_timeout, 28,
    type: Google.Protobuf.Duration,
    json_name: "requestTimeout",
    deprecated: false

  field :request_headers_timeout, 41,
    type: Google.Protobuf.Duration,
    json_name: "requestHeadersTimeout",
    deprecated: false

  field :drain_timeout, 12, type: Google.Protobuf.Duration, json_name: "drainTimeout"

  field :delayed_close_timeout, 26,
    type: Google.Protobuf.Duration,
    json_name: "delayedCloseTimeout"

  field :access_log, 13,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :access_log_flush_interval, 54,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: true

  field :flush_access_log_on_new_request, 55,
    type: :bool,
    json_name: "flushAccessLogOnNewRequest",
    deprecated: true

  field :access_log_options, 56,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.HcmAccessLogOptions,
    json_name: "accessLogOptions"

  field :use_remote_address, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "useRemoteAddress",
    deprecated: false

  field :xff_num_trusted_hops, 19, type: :uint32, json_name: "xffNumTrustedHops"

  field :original_ip_detection_extensions, 46,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "originalIpDetectionExtensions"

  field :early_header_mutation_extensions, 52,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "earlyHeaderMutationExtensions"

  field :internal_address_config, 25,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.InternalAddressConfig,
    json_name: "internalAddressConfig"

  field :skip_xff_append, 21, type: :bool, json_name: "skipXffAppend"
  field :via, 22, type: :string, deprecated: false
  field :generate_request_id, 15, type: Google.Protobuf.BoolValue, json_name: "generateRequestId"
  field :preserve_external_request_id, 32, type: :bool, json_name: "preserveExternalRequestId"

  field :always_set_request_id_in_response, 37,
    type: :bool,
    json_name: "alwaysSetRequestIdInResponse"

  field :forward_client_cert_details, 16,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ForwardClientCertDetails,
    json_name: "forwardClientCertDetails",
    enum: true,
    deprecated: false

  field :set_current_client_cert_details, 17,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.SetCurrentClientCertDetails,
    json_name: "setCurrentClientCertDetails"

  field :proxy_100_continue, 18, type: :bool, json_name: "proxy100Continue"

  field :represent_ipv4_remote_address_as_ipv4_mapped_ipv6, 20,
    type: :bool,
    json_name: "representIpv4RemoteAddressAsIpv4MappedIpv6"

  field :upgrade_configs, 23,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.UpgradeConfig,
    json_name: "upgradeConfigs"

  field :normalize_path, 30, type: Google.Protobuf.BoolValue, json_name: "normalizePath"
  field :merge_slashes, 33, type: :bool, json_name: "mergeSlashes"

  field :path_with_escaped_slashes_action, 45,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.PathWithEscapedSlashesAction,
    json_name: "pathWithEscapedSlashesAction",
    enum: true

  field :request_id_extension, 36,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.RequestIDExtension,
    json_name: "requestIdExtension"

  field :local_reply_config, 38,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.LocalReplyConfig,
    json_name: "localReplyConfig"

  field :strip_matching_host_port, 39,
    type: :bool,
    json_name: "stripMatchingHostPort",
    deprecated: false

  field :strip_any_host_port, 42, type: :bool, json_name: "stripAnyHostPort", oneof: 1

  field :stream_error_on_invalid_http_message, 40,
    type: Google.Protobuf.BoolValue,
    json_name: "streamErrorOnInvalidHttpMessage"

  field :path_normalization_options, 43,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.PathNormalizationOptions,
    json_name: "pathNormalizationOptions"

  field :strip_trailing_host_dot, 47, type: :bool, json_name: "stripTrailingHostDot"

  field :proxy_status_config, 49,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ProxyStatusConfig,
    json_name: "proxyStatusConfig"

  field :typed_header_validation_config, 50,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedHeaderValidationConfig"

  field :append_x_forwarded_port, 51, type: :bool, json_name: "appendXForwardedPort"

  field :add_proxy_protocol_connection_state, 53,
    type: Google.Protobuf.BoolValue,
    json_name: "addProxyProtocolConnectionState"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.LocalReplyConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :mappers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ResponseMapper

  field :body_format, 2,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "bodyFormat"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ResponseMapper do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter, 1, type: Envoy.Config.Accesslog.V3.AccessLogFilter, deprecated: false

  field :status_code, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "statusCode",
    deprecated: false

  field :body, 3, type: Envoy.Config.Core.V3.DataSource

  field :body_format_override, 4,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "bodyFormatOverride"

  field :headers_to_add, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "headersToAdd",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.Rds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :route_config_name, 2, type: :string, json_name: "routeConfigName"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRouteConfigurationsList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :scoped_route_configurations, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.ScopedRouteConfiguration,
    json_name: "scopedRouteConfigurations",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :separator, 1, type: :string, deprecated: false
  field :key, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :extract_type, 0

  field :name, 1, type: :string, deprecated: false
  field :element_separator, 2, type: :string, json_name: "elementSeparator"
  field :index, 3, type: :uint32, oneof: 0

  field :element, 4,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement,
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :header_value_extractor, 1,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor,
    json_name: "headerValueExtractor",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :fragments, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_specifier, 0

  field :name, 1, type: :string, deprecated: false

  field :scope_key_builder, 2,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder,
    json_name: "scopeKeyBuilder",
    deprecated: false

  field :rds_config_source, 3,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "rdsConfigSource"

  field :scoped_route_configurations_list, 4,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRouteConfigurationsList,
    json_name: "scopedRouteConfigurationsList",
    oneof: 0

  field :scoped_rds, 5,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRds,
    json_name: "scopedRds",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :scoped_rds_config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "scopedRdsConfigSource",
    deprecated: false

  field :srds_resources_locator, 2, type: :string, json_name: "srdsResourcesLocator"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0

  field :config_discovery, 5,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery",
    oneof: 0

  field :is_optional, 6, type: :bool, json_name: "isOptional"
  field :disabled, 7, type: :bool
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.RequestIDExtension do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :typed_config, 1, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.EnvoyMobileHttpConnectionManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager
end