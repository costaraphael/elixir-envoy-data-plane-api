defmodule Envoy.Config.Retry.PreviousPriorities.PreviousPrioritiesConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :update_frequency, 1, type: :int32, json_name: "updateFrequency", deprecated: false
end