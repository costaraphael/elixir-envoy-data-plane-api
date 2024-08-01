defmodule Envoy.Config.Listener.V3.Listener.DrainType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :MODIFY_ONLY, 1
end

defmodule Envoy.Config.Listener.V3.AdditionalAddress do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, type: Envoy.Config.Core.V3.Address

  field :socket_options, 2,
    type: Envoy.Config.Core.V3.SocketOptionsOverride,
    json_name: "socketOptions"
end

defmodule Envoy.Config.Listener.V3.ListenerCollection do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entries, 1, repeated: true, type: Xds.Core.V3.CollectionEntry
end

defmodule Envoy.Config.Listener.V3.Listener.DeprecatedV1 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bind_to_port, 1, type: Google.Protobuf.BoolValue, json_name: "bindToPort"
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.ExactBalance do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :balance_type, 0

  field :exact_balance, 1,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.ExactBalance,
    json_name: "exactBalance",
    oneof: 0

  field :extend_balance, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "extendBalance",
    oneof: 0
end

defmodule Envoy.Config.Listener.V3.Listener.InternalListenerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Listener.V3.Listener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :listener_specifier, 0

  field :name, 1, type: :string
  field :address, 2, type: Envoy.Config.Core.V3.Address

  field :additional_addresses, 33,
    repeated: true,
    type: Envoy.Config.Listener.V3.AdditionalAddress,
    json_name: "additionalAddresses"

  field :stat_prefix, 28, type: :string, json_name: "statPrefix"

  field :filter_chains, 3,
    repeated: true,
    type: Envoy.Config.Listener.V3.FilterChain,
    json_name: "filterChains"

  field :filter_chain_matcher, 32,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "filterChainMatcher",
    deprecated: false

  field :use_original_dst, 4, type: Google.Protobuf.BoolValue, json_name: "useOriginalDst"

  field :default_filter_chain, 25,
    type: Envoy.Config.Listener.V3.FilterChain,
    json_name: "defaultFilterChain"

  field :per_connection_buffer_limit_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "perConnectionBufferLimitBytes",
    deprecated: false

  field :metadata, 6, type: Envoy.Config.Core.V3.Metadata

  field :deprecated_v1, 7,
    type: Envoy.Config.Listener.V3.Listener.DeprecatedV1,
    json_name: "deprecatedV1",
    deprecated: true

  field :drain_type, 8,
    type: Envoy.Config.Listener.V3.Listener.DrainType,
    json_name: "drainType",
    enum: true

  field :listener_filters, 9,
    repeated: true,
    type: Envoy.Config.Listener.V3.ListenerFilter,
    json_name: "listenerFilters"

  field :listener_filters_timeout, 15,
    type: Google.Protobuf.Duration,
    json_name: "listenerFiltersTimeout"

  field :continue_on_listener_filters_timeout, 17,
    type: :bool,
    json_name: "continueOnListenerFiltersTimeout"

  field :transparent, 10, type: Google.Protobuf.BoolValue
  field :freebind, 11, type: Google.Protobuf.BoolValue

  field :socket_options, 13,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"

  field :tcp_fast_open_queue_length, 12,
    type: Google.Protobuf.UInt32Value,
    json_name: "tcpFastOpenQueueLength"

  field :traffic_direction, 16,
    type: Envoy.Config.Core.V3.TrafficDirection,
    json_name: "trafficDirection",
    enum: true

  field :udp_listener_config, 18,
    type: Envoy.Config.Listener.V3.UdpListenerConfig,
    json_name: "udpListenerConfig"

  field :api_listener, 19, type: Envoy.Config.Listener.V3.ApiListener, json_name: "apiListener"

  field :connection_balance_config, 20,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig,
    json_name: "connectionBalanceConfig"

  field :reuse_port, 21, type: :bool, json_name: "reusePort", deprecated: true
  field :enable_reuse_port, 29, type: Google.Protobuf.BoolValue, json_name: "enableReusePort"

  field :access_log, 22,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :tcp_backlog_size, 24, type: Google.Protobuf.UInt32Value, json_name: "tcpBacklogSize"

  field :max_connections_to_accept_per_socket_event, 34,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectionsToAcceptPerSocketEvent",
    deprecated: false

  field :bind_to_port, 26, type: Google.Protobuf.BoolValue, json_name: "bindToPort"

  field :internal_listener, 27,
    type: Envoy.Config.Listener.V3.Listener.InternalListenerConfig,
    json_name: "internalListener",
    oneof: 0

  field :enable_mptcp, 30, type: :bool, json_name: "enableMptcp"
  field :ignore_global_conn_limit, 31, type: :bool, json_name: "ignoreGlobalConnLimit"
  field :bypass_overload_manager, 35, type: :bool, json_name: "bypassOverloadManager"
end

defmodule Envoy.Config.Listener.V3.ListenerManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Listener.V3.ValidationListenerManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Listener.V3.ApiListenerManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end