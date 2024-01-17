defmodule Envoy.Type.Matcher.V3.MetadataMatcher.PathSegment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Matcher.V3.MetadataMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Matcher.V3.MetadataMatcher.PathSegment,
    deprecated: false

  field :value, 3, type: Envoy.Type.Matcher.V3.ValueMatcher, deprecated: false
  field :invert, 4, type: :bool
end