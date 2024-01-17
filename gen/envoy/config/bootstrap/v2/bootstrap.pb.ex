defmodule Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :listeners, 1, repeated: true, type: Envoy.Api.V2.Listener
  field :clusters, 2, repeated: true, type: Envoy.Api.V2.Cluster
  field :secrets, 3, repeated: true, type: Envoy.Api.V2.Auth.Secret
end

defmodule Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :lds_config, 1, type: Envoy.Api.V2.Core.ConfigSource, json_name: "ldsConfig"
  field :cds_config, 2, type: Envoy.Api.V2.Core.ConfigSource, json_name: "cdsConfig"
  field :ads_config, 3, type: Envoy.Api.V2.Core.ApiConfigSource, json_name: "adsConfig"
end

defmodule Envoy.Config.Bootstrap.V2.Bootstrap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node

  field :static_resources, 2,
    type: Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources,
    json_name: "staticResources"

  field :dynamic_resources, 3,
    type: Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources,
    json_name: "dynamicResources"

  field :cluster_manager, 4,
    type: Envoy.Config.Bootstrap.V2.ClusterManager,
    json_name: "clusterManager"

  field :hds_config, 14, type: Envoy.Api.V2.Core.ApiConfigSource, json_name: "hdsConfig"
  field :flags_path, 5, type: :string, json_name: "flagsPath"

  field :stats_sinks, 6,
    repeated: true,
    type: Envoy.Config.Metrics.V2.StatsSink,
    json_name: "statsSinks"

  field :stats_config, 13, type: Envoy.Config.Metrics.V2.StatsConfig, json_name: "statsConfig"

  field :stats_flush_interval, 7,
    type: Google.Protobuf.Duration,
    json_name: "statsFlushInterval",
    deprecated: false

  field :watchdog, 8, type: Envoy.Config.Bootstrap.V2.Watchdog
  field :tracing, 9, type: Envoy.Config.Trace.V2.Tracing
  field :runtime, 11, type: Envoy.Config.Bootstrap.V2.Runtime, deprecated: true

  field :layered_runtime, 17,
    type: Envoy.Config.Bootstrap.V2.LayeredRuntime,
    json_name: "layeredRuntime"

  field :admin, 12, type: Envoy.Config.Bootstrap.V2.Admin

  field :overload_manager, 15,
    type: Envoy.Config.Overload.V2alpha.OverloadManager,
    json_name: "overloadManager"

  field :enable_dispatcher_stats, 16, type: :bool, json_name: "enableDispatcherStats"
  field :header_prefix, 18, type: :string, json_name: "headerPrefix"

  field :stats_server_version_override, 19,
    type: Google.Protobuf.UInt64Value,
    json_name: "statsServerVersionOverride"

  field :use_tcp_for_dns_lookups, 20, type: :bool, json_name: "useTcpForDnsLookups"
end

defmodule Envoy.Config.Bootstrap.V2.Admin do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :access_log_path, 1, type: :string, json_name: "accessLogPath"
  field :profile_path, 2, type: :string, json_name: "profilePath"
  field :address, 3, type: Envoy.Api.V2.Core.Address

  field :socket_options, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.SocketOption,
    json_name: "socketOptions"
end

defmodule Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :event_log_path, 1, type: :string, json_name: "eventLogPath"
  field :event_service, 2, type: Envoy.Api.V2.Core.EventServiceConfig, json_name: "eventService"
end

defmodule Envoy.Config.Bootstrap.V2.ClusterManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :local_cluster_name, 1, type: :string, json_name: "localClusterName"

  field :outlier_detection, 2,
    type: Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection,
    json_name: "outlierDetection"

  field :upstream_bind_config, 3,
    type: Envoy.Api.V2.Core.BindConfig,
    json_name: "upstreamBindConfig"

  field :load_stats_config, 4,
    type: Envoy.Api.V2.Core.ApiConfigSource,
    json_name: "loadStatsConfig"
end

defmodule Envoy.Config.Bootstrap.V2.Watchdog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :miss_timeout, 1, type: Google.Protobuf.Duration, json_name: "missTimeout"
  field :megamiss_timeout, 2, type: Google.Protobuf.Duration, json_name: "megamissTimeout"
  field :kill_timeout, 3, type: Google.Protobuf.Duration, json_name: "killTimeout"
  field :multikill_timeout, 4, type: Google.Protobuf.Duration, json_name: "multikillTimeout"
end

defmodule Envoy.Config.Bootstrap.V2.Runtime do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :symlink_root, 1, type: :string, json_name: "symlinkRoot"
  field :subdirectory, 2, type: :string
  field :override_subdirectory, 3, type: :string, json_name: "overrideSubdirectory"
  field :base, 4, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.DiskLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :symlink_root, 1, type: :string, json_name: "symlinkRoot"
  field :subdirectory, 3, type: :string
  field :append_service_cluster, 2, type: :bool, json_name: "appendServiceCluster"
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.AdminLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.RtdsLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :rtds_config, 2, type: Envoy.Api.V2.Core.ConfigSource, json_name: "rtdsConfig"
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :layer_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :static_layer, 2, type: Google.Protobuf.Struct, json_name: "staticLayer", oneof: 0

  field :disk_layer, 3,
    type: Envoy.Config.Bootstrap.V2.RuntimeLayer.DiskLayer,
    json_name: "diskLayer",
    oneof: 0

  field :admin_layer, 4,
    type: Envoy.Config.Bootstrap.V2.RuntimeLayer.AdminLayer,
    json_name: "adminLayer",
    oneof: 0

  field :rtds_layer, 5,
    type: Envoy.Config.Bootstrap.V2.RuntimeLayer.RtdsLayer,
    json_name: "rtdsLayer",
    oneof: 0
end

defmodule Envoy.Config.Bootstrap.V2.LayeredRuntime do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V2.RuntimeLayer
end