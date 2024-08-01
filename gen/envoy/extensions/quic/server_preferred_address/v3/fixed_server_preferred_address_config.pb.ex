defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig.AddressFamilyConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, type: Envoy.Config.Core.V3.SocketAddress
  field :dnat_address, 2, type: Envoy.Config.Core.V3.SocketAddress, json_name: "dnatAddress"
end

defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ipv4_address, 1, type: :string, json_name: "ipv4Address"

  field :ipv4_config, 3,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv4Config"

  field :ipv6_address, 2, type: :string, json_name: "ipv6Address"

  field :ipv6_config, 4,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv6Config"
end