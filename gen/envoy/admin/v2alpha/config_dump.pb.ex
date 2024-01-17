defmodule Envoy.Admin.V2alpha.ConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :configs, 1, repeated: true, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V2alpha.UpdateFailureState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failed_configuration, 1, type: Google.Protobuf.Any, json_name: "failedConfiguration"
  field :last_update_attempt, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdateAttempt"
  field :details, 3, type: :string
end

defmodule Envoy.Admin.V2alpha.BootstrapConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bootstrap, 1, type: Envoy.Config.Bootstrap.V2.Bootstrap
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :listener, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :listener, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :active_state, 2,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState,
    json_name: "activeState"

  field :warming_state, 3,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState,
    json_name: "warmingState"

  field :draining_state, 4,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState,
    json_name: "drainingState"

  field :error_state, 5, type: Envoy.Admin.V2alpha.UpdateFailureState, json_name: "errorState"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener,
    json_name: "staticListeners"

  field :dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener,
    json_name: "dynamicListeners"
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :cluster, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster,
    json_name: "staticClusters"

  field :dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicActiveClusters"

  field :dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicWarmingClusters"
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :route_config, 1, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :route_config, 2, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig,
    json_name: "staticRouteConfigs"

  field :dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig,
    json_name: "dynamicRouteConfigs"
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :scoped_route_configs, 2,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"

  field :scoped_route_configs, 3,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 4, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs,
    json_name: "inlineScopedRouteConfigs"

  field :dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs,
    json_name: "dynamicScopedRouteConfigs"
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 4, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 3, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :static_secrets, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret,
    json_name: "staticSecrets"

  field :dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicActiveSecrets"

  field :dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicWarmingSecrets"
end