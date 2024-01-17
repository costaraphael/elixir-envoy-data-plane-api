defmodule Envoy.Extensions.LoadBalancingPolicies.PickFirst.V3.PickFirst do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :shuffle_address_list, 1, type: :bool, json_name: "shuffleAddressList"
end