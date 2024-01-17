defmodule Envoy.Config.HealthChecker.Redis.V2.Redis do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
end