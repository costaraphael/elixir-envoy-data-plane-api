defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :interface, 2, type: :string
  field :group, 3, type: :string
  field :version, 4, type: :string
  field :routes, 5, repeated: true, type: Envoy.Extensions.Filters.Network.DubboProxy.V3.Route
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.Route do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :match, 1,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteMatch,
    deprecated: false

  field :route, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteAction,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :method, 1, type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch
  field :headers, 2, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :cluster_specifier, 0

  field :cluster, 1, type: :string, oneof: 0

  field :weighted_clusters, 2,
    type: Envoy.Config.Route.V3.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParameterMatchSpecifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :parameter_match_specifier, 0

  field :exact_match, 3, type: :string, json_name: "exactMatch", oneof: 0
  field :range_match, 4, type: Envoy.Type.V3.Int64Range, json_name: "rangeMatch", oneof: 0
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParamsMatchEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :uint32

  field :value, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParameterMatchSpecifier
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: Envoy.Type.Matcher.V3.StringMatcher

  field :params_match, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParamsMatchEntry,
    json_name: "paramsMatch",
    map: true
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MultipleRouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :route_config, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration,
    json_name: "routeConfig"
end