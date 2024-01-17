defmodule Envoy.Config.Filter.Udp.UdpProxy.V2alpha.UdpProxyConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0, deprecated: false
  field :idle_timeout, 3, type: Google.Protobuf.Duration, json_name: "idleTimeout"
end