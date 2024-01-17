defmodule Envoy.Extensions.LoadBalancingPolicies.LeastRequest.V3.LeastRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :choice_count, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "choiceCount",
    deprecated: false

  field :active_request_bias, 2,
    type: Envoy.Config.Core.V3.RuntimeDouble,
    json_name: "activeRequestBias"

  field :slow_start_config, 3,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig,
    json_name: "slowStartConfig"

  field :locality_lb_config, 4,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig,
    json_name: "localityLbConfig"

  field :enable_full_scan, 5, type: Google.Protobuf.BoolValue, json_name: "enableFullScan"
end