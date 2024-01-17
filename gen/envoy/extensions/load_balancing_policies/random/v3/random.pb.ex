defmodule Envoy.Extensions.LoadBalancingPolicies.Random.V3.Random do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :locality_lb_config, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig,
    json_name: "localityLbConfig"
end