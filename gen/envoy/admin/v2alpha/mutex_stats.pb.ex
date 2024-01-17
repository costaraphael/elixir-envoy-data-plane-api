defmodule Envoy.Admin.V2alpha.MutexStats do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :num_contentions, 1, type: :uint64, json_name: "numContentions"
  field :current_wait_cycles, 2, type: :uint64, json_name: "currentWaitCycles"
  field :lifetime_wait_cycles, 3, type: :uint64, json_name: "lifetimeWaitCycles"
end