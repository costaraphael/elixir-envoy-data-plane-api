defmodule Envoy.Extensions.StringMatcher.Lua.V3.Lua do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :source_code, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "sourceCode",
    deprecated: false
end