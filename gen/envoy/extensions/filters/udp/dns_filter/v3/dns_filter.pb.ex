defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ServerContextConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_source, 0

  field :inline_dns_table, 1,
    type: Envoy.Data.Dns.V3.DnsTable,
    json_name: "inlineDnsTable",
    oneof: 0

  field :external_dns_table, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "externalDnsTable",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ClientContextConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resolver_timeout, 1,
    type: Google.Protobuf.Duration,
    json_name: "resolverTimeout",
    deprecated: false

  field :upstream_resolvers, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "upstreamResolvers",
    deprecated: true

  field :dns_resolution_config, 5,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :max_pending_lookups, 3, type: :uint64, json_name: "maxPendingLookups", deprecated: false
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :server_config, 2,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ServerContextConfig,
    json_name: "serverConfig"

  field :client_config, 3,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ClientContextConfig,
    json_name: "clientConfig"
end