defmodule Envoy.Config.Core.V3.DnsResolverOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :use_tcp_for_dns_lookups, 1, type: :bool, json_name: "useTcpForDnsLookups"
  field :no_default_search_domain, 2, type: :bool, json_name: "noDefaultSearchDomain"
end

defmodule Envoy.Config.Core.V3.DnsResolutionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resolvers, 1, repeated: true, type: Envoy.Config.Core.V3.Address, deprecated: false

  field :dns_resolver_options, 2,
    type: Envoy.Config.Core.V3.DnsResolverOptions,
    json_name: "dnsResolverOptions"
end