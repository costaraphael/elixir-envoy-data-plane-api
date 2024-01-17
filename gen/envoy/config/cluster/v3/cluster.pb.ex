defmodule Envoy.Config.Cluster.V3.Cluster.DiscoveryType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :STATIC, 0
  field :STRICT_DNS, 1
  field :LOGICAL_DNS, 2
  field :EDS, 3
  field :ORIGINAL_DST, 4
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ROUND_ROBIN, 0
  field :LEAST_REQUEST, 1
  field :RING_HASH, 2
  field :RANDOM, 3
  field :MAGLEV, 5
  field :CLUSTER_PROVIDED, 6
  field :LOAD_BALANCING_POLICY_CONFIG, 7
end

defmodule Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO, 0
  field :V4_ONLY, 1
  field :V6_ONLY, 2
  field :V4_PREFERRED, 3
  field :ALL, 4
end

defmodule Envoy.Config.Cluster.V3.Cluster.ClusterProtocolSelection do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :USE_CONFIGURED_PROTOCOL, 0
  field :USE_DOWNSTREAM_PROTOCOL, 1
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NO_FALLBACK, 0
  field :ANY_ENDPOINT, 1
  field :DEFAULT_SUBSET, 2
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetMetadataFallbackPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :METADATA_NO_FALLBACK, 0
  field :FALLBACK_LIST, 1
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NOT_DEFINED, 0
  field :NO_FALLBACK, 1
  field :ANY_ENDPOINT, 2
  field :DEFAULT_SUBSET, 3
  field :KEYS_SUBSET, 4
end

defmodule Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig.HashFunction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :XX_HASH, 0
  field :MURMUR_HASH_2, 1
end

defmodule Envoy.Config.Cluster.V3.ClusterCollection do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entries, 1, type: Xds.Core.V3.CollectionEntry
end

defmodule Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :match, 2, type: Google.Protobuf.Struct

  field :transport_socket, 3,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CustomClusterType do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :eds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "edsConfig"
  field :service_name, 2, type: :string, json_name: "serviceName"
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :keys, 1, repeated: true, type: :string
  field :single_host_per_subset, 4, type: :bool, json_name: "singleHostPerSubset"

  field :fallback_policy, 2,
    type:
      Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :fallback_keys_subset, 3, repeated: true, type: :string, json_name: "fallbackKeysSubset"
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :fallback_policy, 1,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :default_subset, 2, type: Google.Protobuf.Struct, json_name: "defaultSubset"

  field :subset_selectors, 3,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector,
    json_name: "subsetSelectors"

  field :locality_weight_aware, 4, type: :bool, json_name: "localityWeightAware"
  field :scale_locality_weight, 5, type: :bool, json_name: "scaleLocalityWeight"
  field :panic_mode_any, 6, type: :bool, json_name: "panicModeAny"
  field :list_as_any, 7, type: :bool, json_name: "listAsAny"

  field :metadata_fallback_policy, 8,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetMetadataFallbackPolicy,
    json_name: "metadataFallbackPolicy",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.SlowStartConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :slow_start_window, 1, type: Google.Protobuf.Duration, json_name: "slowStartWindow"
  field :aggression, 2, type: Envoy.Config.Core.V3.RuntimeDouble
  field :min_weight_percent, 3, type: Envoy.Type.V3.Percent, json_name: "minWeightPercent"
end

defmodule Envoy.Config.Cluster.V3.Cluster.RoundRobinLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :slow_start_config, 1,
    type: Envoy.Config.Cluster.V3.Cluster.SlowStartConfig,
    json_name: "slowStartConfig"
end

defmodule Envoy.Config.Cluster.V3.Cluster.LeastRequestLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :choice_count, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "choiceCount",
    deprecated: false

  field :active_request_bias, 2,
    type: Envoy.Config.Core.V3.RuntimeDouble,
    json_name: "activeRequestBias"

  field :slow_start_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.SlowStartConfig,
    json_name: "slowStartConfig"
end

defmodule Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :minimum_ring_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "minimumRingSize",
    deprecated: false

  field :hash_function, 3,
    type: Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig.HashFunction,
    json_name: "hashFunction",
    enum: true,
    deprecated: false

  field :maximum_ring_size, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maximumRingSize",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.MaglevLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :table_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "tableSize",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.OriginalDstLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :use_http_header, 1, type: :bool, json_name: "useHttpHeader"
  field :http_header_name, 2, type: :string, json_name: "httpHeaderName"

  field :upstream_port_override, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "upstreamPortOverride",
    deprecated: false

  field :metadata_key, 4, type: Envoy.Type.Metadata.V3.MetadataKey, json_name: "metadataKey"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ZoneAwareLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :routing_enabled, 1, type: Envoy.Type.V3.Percent, json_name: "routingEnabled"
  field :min_cluster_size, 2, type: Google.Protobuf.UInt64Value, json_name: "minClusterSize"
  field :fail_traffic_on_panic, 3, type: :bool, json_name: "failTrafficOnPanic"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.LocalityWeightedLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ConsistentHashingLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :use_hostname_for_hashing, 1, type: :bool, json_name: "useHostnameForHashing"

  field :hash_balance_factor, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "hashBalanceFactor",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :locality_config_specifier, 0

  field :healthy_panic_threshold, 1,
    type: Envoy.Type.V3.Percent,
    json_name: "healthyPanicThreshold"

  field :zone_aware_lb_config, 2,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ZoneAwareLbConfig,
    json_name: "zoneAwareLbConfig",
    oneof: 0

  field :locality_weighted_lb_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig",
    oneof: 0

  field :update_merge_window, 4, type: Google.Protobuf.Duration, json_name: "updateMergeWindow"
  field :ignore_new_hosts_until_first_hc, 5, type: :bool, json_name: "ignoreNewHostsUntilFirstHc"

  field :close_connections_on_host_set_change, 6,
    type: :bool,
    json_name: "closeConnectionsOnHostSetChange"

  field :consistent_hashing_lb_config, 7,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"

  field :override_host_status, 8,
    type: Envoy.Config.Core.V3.HealthStatusSet,
    json_name: "overrideHostStatus"
end

defmodule Envoy.Config.Cluster.V3.Cluster.RefreshRate do
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

defmodule Envoy.Config.Cluster.V3.Cluster.PreconnectPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :per_upstream_preconnect_ratio, 1,
    type: Google.Protobuf.DoubleValue,
    json_name: "perUpstreamPreconnectRatio",
    deprecated: false

  field :predictive_preconnect_ratio, 2,
    type: Google.Protobuf.DoubleValue,
    json_name: "predictivePreconnectRatio",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.TypedExtensionProtocolOptionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Cluster.V3.Cluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :cluster_discovery_type, 0

  oneof :lb_config, 1

  field :transport_socket_matches, 43,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch,
    json_name: "transportSocketMatches"

  field :name, 1, type: :string, deprecated: false
  field :alt_stat_name, 28, type: :string, json_name: "altStatName", deprecated: false

  field :type, 2,
    type: Envoy.Config.Cluster.V3.Cluster.DiscoveryType,
    enum: true,
    oneof: 0,
    deprecated: false

  field :cluster_type, 38,
    type: Envoy.Config.Cluster.V3.Cluster.CustomClusterType,
    json_name: "clusterType",
    oneof: 0

  field :eds_cluster_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig,
    json_name: "edsClusterConfig"

  field :connect_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "connectTimeout",
    deprecated: false

  field :per_connection_buffer_limit_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "perConnectionBufferLimitBytes",
    deprecated: false

  field :lb_policy, 6,
    type: Envoy.Config.Cluster.V3.Cluster.LbPolicy,
    json_name: "lbPolicy",
    enum: true,
    deprecated: false

  field :load_assignment, 33,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment,
    json_name: "loadAssignment"

  field :health_checks, 8,
    repeated: true,
    type: Envoy.Config.Core.V3.HealthCheck,
    json_name: "healthChecks"

  field :max_requests_per_connection, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestsPerConnection",
    deprecated: true

  field :circuit_breakers, 10,
    type: Envoy.Config.Cluster.V3.CircuitBreakers,
    json_name: "circuitBreakers"

  field :upstream_http_protocol_options, 46,
    type: Envoy.Config.Core.V3.UpstreamHttpProtocolOptions,
    json_name: "upstreamHttpProtocolOptions",
    deprecated: true

  field :common_http_protocol_options, 29,
    type: Envoy.Config.Core.V3.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions",
    deprecated: true

  field :http_protocol_options, 13,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions",
    deprecated: true

  field :http2_protocol_options, 14,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions",
    deprecated: true

  field :typed_extension_protocol_options, 36,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TypedExtensionProtocolOptionsEntry,
    json_name: "typedExtensionProtocolOptions",
    map: true

  field :dns_refresh_rate, 16,
    type: Google.Protobuf.Duration,
    json_name: "dnsRefreshRate",
    deprecated: false

  field :dns_failure_refresh_rate, 44,
    type: Envoy.Config.Cluster.V3.Cluster.RefreshRate,
    json_name: "dnsFailureRefreshRate"

  field :respect_dns_ttl, 39, type: :bool, json_name: "respectDnsTtl"

  field :dns_lookup_family, 17,
    type: Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily,
    json_name: "dnsLookupFamily",
    enum: true,
    deprecated: false

  field :dns_resolvers, 18,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "dnsResolvers",
    deprecated: true

  field :use_tcp_for_dns_lookups, 45,
    type: :bool,
    json_name: "useTcpForDnsLookups",
    deprecated: true

  field :dns_resolution_config, 53,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 55,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :wait_for_warm_on_init, 54,
    type: Google.Protobuf.BoolValue,
    json_name: "waitForWarmOnInit"

  field :outlier_detection, 19,
    type: Envoy.Config.Cluster.V3.OutlierDetection,
    json_name: "outlierDetection"

  field :cleanup_interval, 20,
    type: Google.Protobuf.Duration,
    json_name: "cleanupInterval",
    deprecated: false

  field :upstream_bind_config, 21,
    type: Envoy.Config.Core.V3.BindConfig,
    json_name: "upstreamBindConfig"

  field :lb_subset_config, 22,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig,
    json_name: "lbSubsetConfig"

  field :ring_hash_lb_config, 23,
    type: Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig,
    json_name: "ringHashLbConfig",
    oneof: 1

  field :maglev_lb_config, 52,
    type: Envoy.Config.Cluster.V3.Cluster.MaglevLbConfig,
    json_name: "maglevLbConfig",
    oneof: 1

  field :original_dst_lb_config, 34,
    type: Envoy.Config.Cluster.V3.Cluster.OriginalDstLbConfig,
    json_name: "originalDstLbConfig",
    oneof: 1

  field :least_request_lb_config, 37,
    type: Envoy.Config.Cluster.V3.Cluster.LeastRequestLbConfig,
    json_name: "leastRequestLbConfig",
    oneof: 1

  field :round_robin_lb_config, 56,
    type: Envoy.Config.Cluster.V3.Cluster.RoundRobinLbConfig,
    json_name: "roundRobinLbConfig",
    oneof: 1

  field :common_lb_config, 27,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig,
    json_name: "commonLbConfig"

  field :transport_socket, 24,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket"

  field :metadata, 25, type: Envoy.Config.Core.V3.Metadata

  field :protocol_selection, 26,
    type: Envoy.Config.Cluster.V3.Cluster.ClusterProtocolSelection,
    json_name: "protocolSelection",
    enum: true,
    deprecated: true

  field :upstream_connection_options, 30,
    type: Envoy.Config.Cluster.V3.UpstreamConnectionOptions,
    json_name: "upstreamConnectionOptions"

  field :close_connections_on_host_health_failure, 31,
    type: :bool,
    json_name: "closeConnectionsOnHostHealthFailure"

  field :ignore_health_on_host_removal, 32, type: :bool, json_name: "ignoreHealthOnHostRemoval"
  field :filters, 40, repeated: true, type: Envoy.Config.Cluster.V3.Filter

  field :load_balancing_policy, 41,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "loadBalancingPolicy"

  field :lrs_server, 42, type: Envoy.Config.Core.V3.ConfigSource, json_name: "lrsServer"

  field :track_timeout_budgets, 47,
    type: :bool,
    json_name: "trackTimeoutBudgets",
    deprecated: true

  field :upstream_config, 48,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "upstreamConfig"

  field :track_cluster_stats, 49,
    type: Envoy.Config.Cluster.V3.TrackClusterStats,
    json_name: "trackClusterStats"

  field :preconnect_policy, 50,
    type: Envoy.Config.Cluster.V3.Cluster.PreconnectPolicy,
    json_name: "preconnectPolicy"

  field :connection_pool_per_downstream_connection, 51,
    type: :bool,
    json_name: "connectionPoolPerDownstreamConnection"
end

defmodule Envoy.Config.Cluster.V3.LoadBalancingPolicy.Policy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :typed_extension_config, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedExtensionConfig"
end

defmodule Envoy.Config.Cluster.V3.LoadBalancingPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :policies, 1, repeated: true, type: Envoy.Config.Cluster.V3.LoadBalancingPolicy.Policy
end

defmodule Envoy.Config.Cluster.V3.UpstreamConnectionOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tcp_keepalive, 1, type: Envoy.Config.Core.V3.TcpKeepalive, json_name: "tcpKeepalive"

  field :set_local_interface_name_on_upstream_connections, 2,
    type: :bool,
    json_name: "setLocalInterfaceNameOnUpstreamConnections"
end

defmodule Envoy.Config.Cluster.V3.TrackClusterStats do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :timeout_budgets, 1, type: :bool, json_name: "timeoutBudgets"
  field :request_response_sizes, 2, type: :bool, json_name: "requestResponseSizes"
  field :per_endpoint_stats, 3, type: :bool, json_name: "perEndpointStats"
end