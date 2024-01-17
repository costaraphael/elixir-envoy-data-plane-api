defmodule Envoy.Type.Matcher.StringMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :match_pattern, 0

  field :exact, 1, type: :string, oneof: 0
  field :prefix, 2, type: :string, oneof: 0, deprecated: false
  field :suffix, 3, type: :string, oneof: 0, deprecated: false
  field :regex, 4, type: :string, oneof: 0, deprecated: true

  field :safe_regex, 5,
    type: Envoy.Type.Matcher.RegexMatcher,
    json_name: "safeRegex",
    oneof: 0,
    deprecated: false

  field :ignore_case, 6, type: :bool, json_name: "ignoreCase"
end

defmodule Envoy.Type.Matcher.ListStringMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :patterns, 1, repeated: true, type: Envoy.Type.Matcher.StringMatcher, deprecated: false
end