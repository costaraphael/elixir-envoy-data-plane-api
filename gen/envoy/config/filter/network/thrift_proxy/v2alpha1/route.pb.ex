defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :routes, 2, repeated: true, type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.Route
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.Route do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :match, 1,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteMatch,
    deprecated: false

  field :route, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteAction,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :match_specifier, 0

  field :method_name, 1, type: :string, json_name: "methodName", oneof: 0
  field :service_name, 2, type: :string, json_name: "serviceName", oneof: 0
  field :invert, 3, type: :bool
  field :headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :cluster_specifier, 0

  field :cluster, 1, type: :string, oneof: 0, deprecated: false

  field :weighted_clusters, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :cluster_header, 6, type: :string, json_name: "clusterHeader", oneof: 0, deprecated: false
  field :metadata_match, 3, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"

  field :rate_limits, 4,
    repeated: true,
    type: Envoy.Api.V2.Route.RateLimit,
    json_name: "rateLimits"

  field :strip_service_name, 5, type: :bool, json_name: "stripServiceName"
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster.ClusterWeight do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: Google.Protobuf.UInt32Value, deprecated: false
  field :metadata_match, 3, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clusters, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster.ClusterWeight,
    deprecated: false
end