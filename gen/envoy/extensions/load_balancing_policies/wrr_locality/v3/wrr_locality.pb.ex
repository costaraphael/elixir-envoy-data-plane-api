defmodule Envoy.Extensions.LoadBalancingPolicies.WrrLocality.V3.WrrLocality do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :endpoint_picking_policy, 1,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "endpointPickingPolicy",
    deprecated: false
end