defmodule Envoy.Admin.V3.ClientResourceStatus do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :REQUESTED, 1
  field :DOES_NOT_EXIST, 2
  field :ACKED, 3
  field :NACKED, 4
end

defmodule Envoy.Admin.V3.UpdateFailureState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failed_configuration, 1, type: Google.Protobuf.Any, json_name: "failedConfiguration"
  field :last_update_attempt, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdateAttempt"
  field :details, 3, type: :string
  field :version_info, 4, type: :string, json_name: "versionInfo"
end

defmodule Envoy.Admin.V3.ListenersConfigDump.StaticListener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :listener, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :listener, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :active_state, 2,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState,
    json_name: "activeState"

  field :warming_state, 3,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState,
    json_name: "warmingState"

  field :draining_state, 4,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState,
    json_name: "drainingState"

  field :error_state, 5, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 6,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.ListenersConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.StaticListener,
    json_name: "staticListeners"

  field :dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListener,
    json_name: "dynamicListeners"
end

defmodule Envoy.Admin.V3.ClustersConfigDump.StaticCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ClustersConfigDump.DynamicCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :cluster, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.ClustersConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.StaticCluster,
    json_name: "staticClusters"

  field :dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicActiveClusters"

  field :dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicWarmingClusters"
end

defmodule Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :route_config, 1, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :route_config, 2, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.RoutesConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig,
    json_name: "staticRouteConfigs"

  field :dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig,
    json_name: "dynamicRouteConfigs"
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :scoped_route_configs, 2,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"

  field :scoped_route_configs, 3,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 4, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 5, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 6,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs,
    json_name: "inlineScopedRouteConfigs"

  field :dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs,
    json_name: "dynamicScopedRouteConfigs"
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :endpoint_config, 1, type: Google.Protobuf.Any, json_name: "endpointConfig"
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :endpoint_config, 2, type: Google.Protobuf.Any, json_name: "endpointConfig"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.EndpointsConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :static_endpoint_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig,
    json_name: "staticEndpointConfigs"

  field :dynamic_endpoint_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig,
    json_name: "dynamicEndpointConfigs"
end

defmodule Envoy.Admin.V3.EcdsConfigDump.EcdsFilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :ecds_filter, 2, type: Google.Protobuf.Any, json_name: "ecdsFilter"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.EcdsConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ecds_filters, 1,
    repeated: true,
    type: Envoy.Admin.V3.EcdsConfigDump.EcdsFilterConfig,
    json_name: "ecdsFilters"
end