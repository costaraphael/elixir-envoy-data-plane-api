defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetFallbackPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NO_FALLBACK, 0
  field :ANY_ENDPOINT, 1
  field :DEFAULT_SUBSET, 2
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetMetadataFallbackPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :METADATA_NO_FALLBACK, 0
  field :FALLBACK_LIST, 1
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NOT_DEFINED, 0
  field :NO_FALLBACK, 1
  field :ANY_ENDPOINT, 2
  field :DEFAULT_SUBSET, 3
  field :KEYS_SUBSET, 4
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :keys, 1, repeated: true, type: :string
  field :single_host_per_subset, 4, type: :bool, json_name: "singleHostPerSubset"

  field :fallback_policy, 2,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :fallback_keys_subset, 3, repeated: true, type: :string, json_name: "fallbackKeysSubset"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :fallback_policy, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :default_subset, 2, type: Google.Protobuf.Struct, json_name: "defaultSubset"

  field :subset_selectors, 3,
    repeated: true,
    type: Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector,
    json_name: "subsetSelectors"

  field :allow_redundant_keys, 10, type: :bool, json_name: "allowRedundantKeys"
  field :locality_weight_aware, 4, type: :bool, json_name: "localityWeightAware"
  field :scale_locality_weight, 5, type: :bool, json_name: "scaleLocalityWeight"
  field :panic_mode_any, 6, type: :bool, json_name: "panicModeAny"
  field :list_as_any, 7, type: :bool, json_name: "listAsAny"

  field :metadata_fallback_policy, 8,
    type: Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetMetadataFallbackPolicy,
    json_name: "metadataFallbackPolicy",
    enum: true,
    deprecated: false

  field :subset_lb_policy, 9,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "subsetLbPolicy",
    deprecated: false
end