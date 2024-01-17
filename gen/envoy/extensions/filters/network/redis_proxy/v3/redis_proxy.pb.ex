defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :MASTER, 0
  field :PREFER_MASTER, 1
  field :REPLICA, 2
  field :PREFER_REPLICA, 3
  field :ANY, 4
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DELAY, 0
  field :ERROR, 1
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :op_timeout, 1, type: Google.Protobuf.Duration, json_name: "opTimeout", deprecated: false
  field :enable_hashtagging, 2, type: :bool, json_name: "enableHashtagging"
  field :enable_redirection, 3, type: :bool, json_name: "enableRedirection"

  field :dns_cache_config, 9,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig"

  field :max_buffer_size_before_flush, 4, type: :uint32, json_name: "maxBufferSizeBeforeFlush"
  field :buffer_flush_timeout, 5, type: Google.Protobuf.Duration, json_name: "bufferFlushTimeout"

  field :max_upstream_unknown_connections, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxUpstreamUnknownConnections"

  field :enable_command_stats, 8, type: :bool, json_name: "enableCommandStats"

  field :read_policy, 7,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy,
    json_name: "readPolicy",
    enum: true,
    deprecated: false

  field :connection_rate_limit, 10,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnectionRateLimit,
    json_name: "connectionRateLimit"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false

  field :runtime_fraction, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :exclude_read_commands, 3, type: :bool, json_name: "excludeReadCommands"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.ReadCommandPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :prefix, 1, type: :string, deprecated: false
  field :remove_prefix, 2, type: :bool, json_name: "removePrefix"
  field :cluster, 3, type: :string, deprecated: false

  field :request_mirror_policy, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy,
    json_name: "requestMirrorPolicy"

  field :key_formatter, 5, type: :string, json_name: "keyFormatter"

  field :read_command_policy, 6,
    type:
      Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.ReadCommandPolicy,
    json_name: "readCommandPolicy"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :routes, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route

  field :case_insensitive, 2, type: :bool, json_name: "caseInsensitive"

  field :catch_all_route, 4,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route,
    json_name: "catchAllRoute"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :fault_type, 1,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType,
    json_name: "faultType",
    enum: true,
    deprecated: false

  field :fault_enabled, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "faultEnabled",
    deprecated: false

  field :delay, 3, type: Google.Protobuf.Duration
  field :commands, 4, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnectionRateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :connection_rate_limit_per_sec, 1,
    type: :uint32,
    json_name: "connectionRateLimitPerSec",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :settings, 3,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings,
    deprecated: false

  field :latency_in_micros, 4, type: :bool, json_name: "latencyInMicros"

  field :prefix_routes, 5,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes,
    json_name: "prefixRoutes"

  field :downstream_auth_password, 6,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "downstreamAuthPassword",
    deprecated: true

  field :downstream_auth_passwords, 9,
    repeated: true,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "downstreamAuthPasswords",
    deprecated: false

  field :faults, 8,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault

  field :downstream_auth_username, 7,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "downstreamAuthUsername",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :auth_password, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "authPassword",
    deprecated: false

  field :auth_username, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "authUsername",
    deprecated: false
end