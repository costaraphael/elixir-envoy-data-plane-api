defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: :uint32, deprecated: false
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :hostname, 1, type: :string, deprecated: false
  field :use_post, 2, type: :bool, json_name: "usePost"

  field :headers_to_add, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "headersToAdd",
    deprecated: false

  field :propagate_response_headers, 4, type: :bool, json_name: "propagateResponseHeaders"
  field :post_path, 5, type: :string, json_name: "postPath"
  field :propagate_response_trailers, 6, type: :bool, json_name: "propagateResponseTrailers"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.OnDemand do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :odcds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "odcdsConfig"
  field :resources_locator, 2, type: :string, json_name: "resourcesLocator"
  field :timeout, 3, type: Google.Protobuf.Duration
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TcpAccessLogOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :access_log_flush_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: false

  field :flush_access_log_on_connected, 2, type: :bool, json_name: "flushAccessLogOnConnected"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :cluster_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0

  field :weighted_clusters, 10,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :on_demand, 14,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.OnDemand,
    json_name: "onDemand"

  field :metadata_match, 9, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
  field :idle_timeout, 8, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :downstream_idle_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "downstreamIdleTimeout"

  field :upstream_idle_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "upstreamIdleTimeout"

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :max_connect_attempts, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts",
    deprecated: false

  field :hash_policy, 11,
    repeated: true,
    type: Envoy.Type.V3.HashPolicy,
    json_name: "hashPolicy",
    deprecated: false

  field :tunneling_config, 12,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig,
    json_name: "tunnelingConfig"

  field :max_downstream_connection_duration, 13,
    type: Google.Protobuf.Duration,
    json_name: "maxDownstreamConnectionDuration",
    deprecated: false

  field :access_log_flush_interval, 15,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: true

  field :flush_access_log_on_connected, 16,
    type: :bool,
    json_name: "flushAccessLogOnConnected",
    deprecated: true

  field :access_log_options, 17,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TcpAccessLogOptions,
    json_name: "accessLogOptions"
end