defmodule Envoy.Config.Filter.Http.Lua.V2.Lua do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inline_code, 1, type: :string, json_name: "inlineCode", deprecated: false
end