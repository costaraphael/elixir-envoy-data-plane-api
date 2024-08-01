defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
  field :port, 2, type: Envoy.Config.Core.V3.DataSource
  field :dnat_address, 3, type: Envoy.Config.Core.V3.DataSource, json_name: "dnatAddress"
end

defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ipv4_config, 1,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv4Config"

  field :ipv6_config, 2,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv6Config"
end