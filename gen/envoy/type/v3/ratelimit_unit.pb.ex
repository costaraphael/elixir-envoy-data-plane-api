defmodule Envoy.Type.V3.RateLimitUnit do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :SECOND, 1
  field :MINUTE, 2
  field :HOUR, 3
  field :DAY, 4
  field :MONTH, 5
  field :YEAR, 6
end