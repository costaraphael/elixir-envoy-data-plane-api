defmodule Envoy.Extensions.Filters.Network.SniDynamicForwardProxy.V3.FilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :port_specifier, 0

  field :dns_cache_config, 1,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    deprecated: false

  field :port_value, 2, type: :uint32, json_name: "portValue", oneof: 0, deprecated: false
end