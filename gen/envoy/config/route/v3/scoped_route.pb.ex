defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :string_key, 1, type: :string, json_name: "stringKey", oneof: 0
end

defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration.Key do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :fragments, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment,
    deprecated: false
end

defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :on_demand, 4, type: :bool, json_name: "onDemand"
  field :name, 1, type: :string, deprecated: false

  field :route_configuration_name, 2,
    type: :string,
    json_name: "routeConfigurationName",
    deprecated: false

  field :route_configuration, 5,
    type: Envoy.Config.Route.V3.RouteConfiguration,
    json_name: "routeConfiguration",
    deprecated: false

  field :key, 3, type: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key, deprecated: false
end