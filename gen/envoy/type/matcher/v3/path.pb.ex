defmodule Envoy.Type.Matcher.V3.PathMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :path, 1, type: Envoy.Type.Matcher.V3.StringMatcher, oneof: 0, deprecated: false
end