defmodule Envoy.Extensions.Matching.InputMatchers.RuntimeFraction.V3.RuntimeFraction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :runtime_fraction, 1,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction",
    deprecated: false

  field :seed, 2, type: :uint64
end