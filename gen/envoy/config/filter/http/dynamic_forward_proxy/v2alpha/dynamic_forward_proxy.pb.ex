defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.FilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dns_cache_config, 1,
    type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.PerRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :host_rewrite_specifier, 0

  field :host_rewrite, 1, type: :string, json_name: "hostRewrite", oneof: 0, deprecated: false

  field :auto_host_rewrite_header, 2,
    type: :string,
    json_name: "autoHostRewriteHeader",
    oneof: 0,
    deprecated: false
end