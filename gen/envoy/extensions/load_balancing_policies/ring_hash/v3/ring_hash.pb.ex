defmodule Envoy.Extensions.LoadBalancingPolicies.RingHash.V3.RingHash.HashFunction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT_HASH, 0
  field :XX_HASH, 1
  field :MURMUR_HASH_2, 2
end

defmodule Envoy.Extensions.LoadBalancingPolicies.RingHash.V3.RingHash do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :hash_function, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.RingHash.V3.RingHash.HashFunction,
    json_name: "hashFunction",
    enum: true,
    deprecated: false

  field :minimum_ring_size, 2,
    type: Google.Protobuf.UInt64Value,
    json_name: "minimumRingSize",
    deprecated: false

  field :maximum_ring_size, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "maximumRingSize",
    deprecated: false

  field :use_hostname_for_hashing, 4,
    type: :bool,
    json_name: "useHostnameForHashing",
    deprecated: true

  field :hash_balance_factor, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "hashBalanceFactor",
    deprecated: true

  field :consistent_hashing_lb_config, 6,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"

  field :locality_weighted_lb_config, 7,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig"
end