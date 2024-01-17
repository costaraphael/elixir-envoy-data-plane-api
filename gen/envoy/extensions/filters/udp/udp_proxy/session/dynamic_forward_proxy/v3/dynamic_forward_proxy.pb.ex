defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.DynamicForwardProxy.V3.FilterConfig.BufferOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_buffered_datagrams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedDatagrams"

  field :max_buffered_bytes, 2, type: Google.Protobuf.UInt64Value, json_name: "maxBufferedBytes"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.DynamicForwardProxy.V3.FilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :implementation_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :dns_cache_config, 2,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    oneof: 0,
    deprecated: false

  field :buffer_options, 3,
    type:
      Envoy.Extensions.Filters.Udp.UdpProxy.Session.DynamicForwardProxy.V3.FilterConfig.BufferOptions,
    json_name: "bufferOptions"
end