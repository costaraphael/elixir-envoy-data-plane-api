defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :ipv4_type, 0

  oneof :ipv6_type, 1

  field :ipv4_address, 1, type: :string, json_name: "ipv4Address", oneof: 0
  field :ipv6_address, 2, type: :string, json_name: "ipv6Address", oneof: 1
end