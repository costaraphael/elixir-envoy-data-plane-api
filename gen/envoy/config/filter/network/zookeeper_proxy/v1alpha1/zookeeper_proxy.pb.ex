defmodule Envoy.Config.Filter.Network.ZookeeperProxy.V1alpha1.ZooKeeperProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :max_packet_bytes, 3, type: Google.Protobuf.UInt32Value, json_name: "maxPacketBytes"
end