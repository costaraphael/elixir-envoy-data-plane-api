defmodule Envoy.Extensions.Matching.InputMatchers.Ip.V3.Ip do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cidr_ranges, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "cidrRanges",
    deprecated: false

  field :stat_prefix, 2, type: :string, json_name: "statPrefix", deprecated: false
end