defmodule Envoy.Config.Filter.Network.ClientSslAuth.V2.ClientSSLAuth do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :auth_api_cluster, 1, type: :string, json_name: "authApiCluster", deprecated: false
  field :stat_prefix, 2, type: :string, json_name: "statPrefix", deprecated: false
  field :refresh_delay, 3, type: Google.Protobuf.Duration, json_name: "refreshDelay"

  field :ip_white_list, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "ipWhiteList"
end