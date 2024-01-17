defmodule Envoy.Extensions.AccessLoggers.Filters.Cel.V3.ExpressionFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :expression, 1, type: :string
end