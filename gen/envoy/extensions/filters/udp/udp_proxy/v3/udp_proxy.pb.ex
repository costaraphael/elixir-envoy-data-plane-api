defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :policy_specifier, 0

  field :source_ip, 1, type: :bool, json_name: "sourceIp", oneof: 0, deprecated: false
  field :key, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.SessionFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.BufferOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_buffered_datagrams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedDatagrams"

  field :max_buffered_bytes, 2, type: Google.Protobuf.UInt64Value, json_name: "maxBufferedBytes"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.RetryOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_connect_attempts, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :proxy_host, 1, type: :string, json_name: "proxyHost", deprecated: false
  field :proxy_port, 2, type: Google.Protobuf.UInt32Value, json_name: "proxyPort"
  field :target_host, 3, type: :string, json_name: "targetHost", deprecated: false
  field :default_target_port, 4, type: :uint32, json_name: "defaultTargetPort", deprecated: false
  field :use_post, 5, type: :bool, json_name: "usePost"
  field :post_path, 6, type: :string, json_name: "postPath"

  field :retry_options, 7,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.RetryOptions,
    json_name: "retryOptions"

  field :headers_to_add, 8,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "headersToAdd",
    deprecated: false

  field :buffer_options, 9,
    type:
      Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.BufferOptions,
    json_name: "bufferOptions"

  field :propagate_response_headers, 10, type: :bool, json_name: "propagateResponseHeaders"
  field :propagate_response_trailers, 11, type: :bool, json_name: "propagateResponseTrailers"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpAccessLogOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :access_log_flush_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: false

  field :flush_access_log_on_tunnel_connected, 2,
    type: :bool,
    json_name: "flushAccessLogOnTunnelConnected"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0, deprecated: true
  field :matcher, 9, type: Xds.Type.Matcher.V3.Matcher, oneof: 0, deprecated: false
  field :idle_timeout, 3, type: Google.Protobuf.Duration, json_name: "idleTimeout"
  field :use_original_src_ip, 4, type: :bool, json_name: "useOriginalSrcIp"

  field :hash_policies, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy,
    json_name: "hashPolicies",
    deprecated: false

  field :upstream_socket_config, 6,
    type: Envoy.Config.Core.V3.UdpSocketConfig,
    json_name: "upstreamSocketConfig"

  field :use_per_packet_load_balancing, 7, type: :bool, json_name: "usePerPacketLoadBalancing"

  field :access_log, 8,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :proxy_access_log, 10,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "proxyAccessLog"

  field :session_filters, 11,
    repeated: true,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.SessionFilter,
    json_name: "sessionFilters"

  field :tunneling_config, 12,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig,
    json_name: "tunnelingConfig"

  field :access_log_options, 13,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpAccessLogOptions,
    json_name: "accessLogOptions"
end