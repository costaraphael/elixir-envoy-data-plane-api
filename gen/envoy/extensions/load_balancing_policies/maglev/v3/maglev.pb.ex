defmodule Envoy.Extensions.LoadBalancingPolicies.Maglev.V3.Maglev do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :table_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "tableSize",
    deprecated: false

  field :consistent_hashing_lb_config, 2,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"

  field :locality_weighted_lb_config, 3,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig"
end