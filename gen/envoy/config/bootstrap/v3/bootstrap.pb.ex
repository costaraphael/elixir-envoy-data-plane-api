defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :KILL, 1
  field :MULTIKILL, 2
  field :MEGAMISS, 3
  field :MISS, 4
end

defmodule Envoy.Config.Bootstrap.V3.CustomInlineHeader.InlineHeaderType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :REQUEST_HEADER, 0
  field :REQUEST_TRAILER, 1
  field :RESPONSE_HEADER, 2
  field :RESPONSE_TRAILER, 3
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :listeners, 1, repeated: true, type: Envoy.Config.Listener.V3.Listener
  field :clusters, 2, repeated: true, type: Envoy.Config.Cluster.V3.Cluster
  field :secrets, 3, repeated: true, type: Envoy.Extensions.TransportSockets.Tls.V3.Secret
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :lds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "ldsConfig"
  field :lds_resources_locator, 5, type: :string, json_name: "ldsResourcesLocator"
  field :cds_config, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "cdsConfig"
  field :cds_resources_locator, 6, type: :string, json_name: "cdsResourcesLocator"
  field :ads_config, 3, type: Envoy.Config.Core.V3.ApiConfigSource, json_name: "adsConfig"
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig.LogFormat do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :log_format, 0

  field :json_format, 1, type: Google.Protobuf.Struct, json_name: "jsonFormat", oneof: 0
  field :text_format, 2, type: :string, json_name: "textFormat", oneof: 0
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :log_format, 1,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig.LogFormat,
    json_name: "logFormat"
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.DeferredStatOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :enable_deferred_creation_stats, 1, type: :bool, json_name: "enableDeferredCreationStats"
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.GrpcAsyncClientManagerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_cached_entry_idle_duration, 1,
    type: Google.Protobuf.Duration,
    json_name: "maxCachedEntryIdleDuration",
    deprecated: false
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :stats_flush, 0

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :node_context_params, 26, repeated: true, type: :string, json_name: "nodeContextParams"

  field :static_resources, 2,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources,
    json_name: "staticResources"

  field :dynamic_resources, 3,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources,
    json_name: "dynamicResources"

  field :cluster_manager, 4,
    type: Envoy.Config.Bootstrap.V3.ClusterManager,
    json_name: "clusterManager"

  field :hds_config, 14, type: Envoy.Config.Core.V3.ApiConfigSource, json_name: "hdsConfig"
  field :flags_path, 5, type: :string, json_name: "flagsPath"

  field :stats_sinks, 6,
    repeated: true,
    type: Envoy.Config.Metrics.V3.StatsSink,
    json_name: "statsSinks"

  field :deferred_stat_options, 39,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.DeferredStatOptions,
    json_name: "deferredStatOptions"

  field :stats_config, 13, type: Envoy.Config.Metrics.V3.StatsConfig, json_name: "statsConfig"

  field :stats_flush_interval, 7,
    type: Google.Protobuf.Duration,
    json_name: "statsFlushInterval",
    deprecated: false

  field :stats_flush_on_admin, 29,
    type: :bool,
    json_name: "statsFlushOnAdmin",
    oneof: 0,
    deprecated: false

  field :watchdog, 8, type: Envoy.Config.Bootstrap.V3.Watchdog, deprecated: true
  field :watchdogs, 27, type: Envoy.Config.Bootstrap.V3.Watchdogs
  field :tracing, 9, type: Envoy.Config.Trace.V3.Tracing, deprecated: true

  field :layered_runtime, 17,
    type: Envoy.Config.Bootstrap.V3.LayeredRuntime,
    json_name: "layeredRuntime"

  field :admin, 12, type: Envoy.Config.Bootstrap.V3.Admin

  field :overload_manager, 15,
    type: Envoy.Config.Overload.V3.OverloadManager,
    json_name: "overloadManager",
    deprecated: false

  field :enable_dispatcher_stats, 16, type: :bool, json_name: "enableDispatcherStats"
  field :header_prefix, 18, type: :string, json_name: "headerPrefix"

  field :stats_server_version_override, 19,
    type: Google.Protobuf.UInt64Value,
    json_name: "statsServerVersionOverride"

  field :use_tcp_for_dns_lookups, 20,
    type: :bool,
    json_name: "useTcpForDnsLookups",
    deprecated: true

  field :dns_resolution_config, 30,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 31,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :bootstrap_extensions, 21,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "bootstrapExtensions"

  field :fatal_actions, 28,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.FatalAction,
    json_name: "fatalActions"

  field :config_sources, 22,
    repeated: true,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSources"

  field :default_config_source, 23,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "defaultConfigSource"

  field :default_socket_interface, 24, type: :string, json_name: "defaultSocketInterface"

  field :certificate_provider_instances, 25,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry,
    json_name: "certificateProviderInstances",
    map: true

  field :inline_headers, 32,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.CustomInlineHeader,
    json_name: "inlineHeaders"

  field :perf_tracing_file_path, 33, type: :string, json_name: "perfTracingFilePath"

  field :default_regex_engine, 34,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "defaultRegexEngine"

  field :xds_delegate_extension, 35,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "xdsDelegateExtension"

  field :xds_config_tracker_extension, 36,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "xdsConfigTrackerExtension"

  field :listener_manager, 37,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "listenerManager"

  field :application_log_config, 38,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig,
    json_name: "applicationLogConfig"

  field :grpc_async_client_manager_config, 40,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.GrpcAsyncClientManagerConfig,
    json_name: "grpcAsyncClientManagerConfig"
end

defmodule Envoy.Config.Bootstrap.V3.Admin do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :access_log_path, 1, type: :string, json_name: "accessLogPath", deprecated: true
  field :profile_path, 2, type: :string, json_name: "profilePath"
  field :address, 3, type: Envoy.Config.Core.V3.Address

  field :socket_options, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"

  field :ignore_global_conn_limit, 6, type: :bool, json_name: "ignoreGlobalConnLimit"
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :event_log_path, 1, type: :string, json_name: "eventLogPath"

  field :event_service, 2,
    type: Envoy.Config.Core.V3.EventServiceConfig,
    json_name: "eventService"
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :local_cluster_name, 1, type: :string, json_name: "localClusterName"

  field :outlier_detection, 2,
    type: Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection,
    json_name: "outlierDetection"

  field :upstream_bind_config, 3,
    type: Envoy.Config.Core.V3.BindConfig,
    json_name: "upstreamBindConfig"

  field :load_stats_config, 4,
    type: Envoy.Config.Core.V3.ApiConfigSource,
    json_name: "loadStatsConfig"

  field :enable_deferred_cluster_creation, 5,
    type: :bool,
    json_name: "enableDeferredClusterCreation"
end

defmodule Envoy.Config.Bootstrap.V3.Watchdogs do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :main_thread_watchdog, 1,
    type: Envoy.Config.Bootstrap.V3.Watchdog,
    json_name: "mainThreadWatchdog"

  field :worker_watchdog, 2, type: Envoy.Config.Bootstrap.V3.Watchdog, json_name: "workerWatchdog"
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig

  field :event, 2,
    type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :actions, 7, repeated: true, type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction
  field :miss_timeout, 1, type: Google.Protobuf.Duration, json_name: "missTimeout"
  field :megamiss_timeout, 2, type: Google.Protobuf.Duration, json_name: "megamissTimeout"
  field :kill_timeout, 3, type: Google.Protobuf.Duration, json_name: "killTimeout"

  field :max_kill_timeout_jitter, 6,
    type: Google.Protobuf.Duration,
    json_name: "maxKillTimeoutJitter",
    deprecated: false

  field :multikill_timeout, 4, type: Google.Protobuf.Duration, json_name: "multikillTimeout"
  field :multikill_threshold, 5, type: Envoy.Type.V3.Percent, json_name: "multikillThreshold"
end

defmodule Envoy.Config.Bootstrap.V3.FatalAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

defmodule Envoy.Config.Bootstrap.V3.Runtime do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :symlink_root, 1, type: :string, json_name: "symlinkRoot"
  field :subdirectory, 2, type: :string
  field :override_subdirectory, 3, type: :string, json_name: "overrideSubdirectory"
  field :base, 4, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :symlink_root, 1, type: :string, json_name: "symlinkRoot"
  field :subdirectory, 3, type: :string
  field :append_service_cluster, 2, type: :bool, json_name: "appendServiceCluster"
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :rtds_config, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "rtdsConfig"
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :layer_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :static_layer, 2, type: Google.Protobuf.Struct, json_name: "staticLayer", oneof: 0

  field :disk_layer, 3,
    type: Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer,
    json_name: "diskLayer",
    oneof: 0

  field :admin_layer, 4,
    type: Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer,
    json_name: "adminLayer",
    oneof: 0

  field :rtds_layer, 5,
    type: Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer,
    json_name: "rtdsLayer",
    oneof: 0
end

defmodule Envoy.Config.Bootstrap.V3.LayeredRuntime do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V3.RuntimeLayer
end

defmodule Envoy.Config.Bootstrap.V3.CustomInlineHeader do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inline_header_name, 1, type: :string, json_name: "inlineHeaderName", deprecated: false

  field :inline_header_type, 2,
    type: Envoy.Config.Bootstrap.V3.CustomInlineHeader.InlineHeaderType,
    json_name: "inlineHeaderType",
    enum: true,
    deprecated: false
end