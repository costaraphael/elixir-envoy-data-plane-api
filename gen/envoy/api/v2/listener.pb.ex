defmodule Envoy.Api.V2.Listener.DrainType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :MODIFY_ONLY, 1
end

defmodule Envoy.Api.V2.Listener.DeprecatedV1 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bind_to_port, 1, type: Google.Protobuf.BoolValue, json_name: "bindToPort"
end

defmodule Envoy.Api.V2.Listener.ConnectionBalanceConfig.ExactBalance do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.Listener.ConnectionBalanceConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :balance_type, 0

  field :exact_balance, 1,
    type: Envoy.Api.V2.Listener.ConnectionBalanceConfig.ExactBalance,
    json_name: "exactBalance",
    oneof: 0
end

defmodule Envoy.Api.V2.Listener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :address, 2, type: Envoy.Api.V2.Core.Address, deprecated: false

  field :filter_chains, 3,
    repeated: true,
    type: Envoy.Api.V2.Listener.FilterChain,
    json_name: "filterChains"

  field :use_original_dst, 4,
    type: Google.Protobuf.BoolValue,
    json_name: "useOriginalDst",
    deprecated: true

  field :per_connection_buffer_limit_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "perConnectionBufferLimitBytes"

  field :metadata, 6, type: Envoy.Api.V2.Core.Metadata
  field :deprecated_v1, 7, type: Envoy.Api.V2.Listener.DeprecatedV1, json_name: "deprecatedV1"
  field :drain_type, 8, type: Envoy.Api.V2.Listener.DrainType, json_name: "drainType", enum: true

  field :listener_filters, 9,
    repeated: true,
    type: Envoy.Api.V2.Listener.ListenerFilter,
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
    type: Envoy.Api.V2.Core.SocketOption,
    json_name: "socketOptions"

  field :tcp_fast_open_queue_length, 12,
    type: Google.Protobuf.UInt32Value,
    json_name: "tcpFastOpenQueueLength"

  field :traffic_direction, 16,
    type: Envoy.Api.V2.Core.TrafficDirection,
    json_name: "trafficDirection",
    enum: true

  field :udp_listener_config, 18,
    type: Envoy.Api.V2.Listener.UdpListenerConfig,
    json_name: "udpListenerConfig"

  field :api_listener, 19, type: Envoy.Config.Listener.V2.ApiListener, json_name: "apiListener"

  field :connection_balance_config, 20,
    type: Envoy.Api.V2.Listener.ConnectionBalanceConfig,
    json_name: "connectionBalanceConfig"

  field :reuse_port, 21, type: :bool, json_name: "reusePort"

  field :access_log, 22,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLog,
    json_name: "accessLog"
end