defmodule Envoy.Extensions.TransportSockets.S2a.V3.S2AConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :s2a_address, 1, type: :string, json_name: "s2aAddress", deprecated: false
end