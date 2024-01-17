defmodule Envoy.Watchdog.V3.AbortActionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :wait_duration, 1, type: Google.Protobuf.Duration, json_name: "waitDuration"
end