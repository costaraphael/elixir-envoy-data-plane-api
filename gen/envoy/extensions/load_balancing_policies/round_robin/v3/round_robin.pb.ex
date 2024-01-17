defmodule Envoy.Extensions.LoadBalancingPolicies.RoundRobin.V3.RoundRobin do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :slow_start_config, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig,
    json_name: "slowStartConfig"

  field :locality_lb_config, 2,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig,
    json_name: "localityLbConfig"
end