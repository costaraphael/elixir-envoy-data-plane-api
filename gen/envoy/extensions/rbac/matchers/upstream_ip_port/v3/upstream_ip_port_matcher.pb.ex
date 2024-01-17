defmodule Envoy.Extensions.Rbac.Matchers.UpstreamIpPort.V3.UpstreamIpPortMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :upstream_ip, 1, type: Envoy.Config.Core.V3.CidrRange, json_name: "upstreamIp"
  field :upstream_port_range, 2, type: Envoy.Type.V3.Int64Range, json_name: "upstreamPortRange"
end