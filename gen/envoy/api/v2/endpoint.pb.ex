defmodule Envoy.Api.V2.ClusterLoadAssignment.Policy.DropOverload do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :category, 1, type: :string, deprecated: false
  field :drop_percentage, 2, type: Envoy.Type.FractionalPercent, json_name: "dropPercentage"
end

defmodule Envoy.Api.V2.ClusterLoadAssignment.Policy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :drop_overloads, 2,
    repeated: true,
    type: Envoy.Api.V2.ClusterLoadAssignment.Policy.DropOverload,
    json_name: "dropOverloads"

  field :overprovisioning_factor, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "overprovisioningFactor",
    deprecated: false

  field :endpoint_stale_after, 4,
    type: Google.Protobuf.Duration,
    json_name: "endpointStaleAfter",
    deprecated: false

  field :disable_overprovisioning, 5,
    type: :bool,
    json_name: "disableOverprovisioning",
    deprecated: true
end

defmodule Envoy.Api.V2.ClusterLoadAssignment.NamedEndpointsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Api.V2.Endpoint.Endpoint
end

defmodule Envoy.Api.V2.ClusterLoadAssignment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
  field :endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.LocalityLbEndpoints

  field :named_endpoints, 5,
    repeated: true,
    type: Envoy.Api.V2.ClusterLoadAssignment.NamedEndpointsEntry,
    json_name: "namedEndpoints",
    map: true

  field :policy, 4, type: Envoy.Api.V2.ClusterLoadAssignment.Policy
end