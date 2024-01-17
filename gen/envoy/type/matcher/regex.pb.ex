defmodule Envoy.Type.Matcher.RegexMatcher.GoogleRE2 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_program_size, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxProgramSize",
    deprecated: true
end

defmodule Envoy.Type.Matcher.RegexMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :engine_type, 0

  field :google_re2, 1,
    type: Envoy.Type.Matcher.RegexMatcher.GoogleRE2,
    json_name: "googleRe2",
    oneof: 0,
    deprecated: false

  field :regex, 2, type: :string, deprecated: false
end

defmodule Envoy.Type.Matcher.RegexMatchAndSubstitute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :pattern, 1, type: Envoy.Type.Matcher.RegexMatcher
  field :substitution, 2, type: :string
end