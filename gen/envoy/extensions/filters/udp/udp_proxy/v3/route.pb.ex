defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.Route do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false
end