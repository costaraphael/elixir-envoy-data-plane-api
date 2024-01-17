defmodule Envoy.Type.Matcher.DoubleMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :match_pattern, 0

  field :range, 1, type: Envoy.Type.DoubleRange, oneof: 0
  field :exact, 2, type: :double, oneof: 0
end