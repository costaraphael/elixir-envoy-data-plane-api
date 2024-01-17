defmodule Envoy.Data.Dns.V2alpha.DnsTable.AddressList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :endpoint_config, 0

  field :address_list, 1,
    type: Envoy.Data.Dns.V2alpha.DnsTable.AddressList,
    json_name: "addressList",
    oneof: 0
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :endpoint, 2, type: Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint
  field :answer_ttl, 3, type: Google.Protobuf.Duration, json_name: "answerTtl", deprecated: false
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :external_retry_count, 1, type: :uint32, json_name: "externalRetryCount"

  field :virtual_domains, 2,
    repeated: true,
    type: Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain,
    json_name: "virtualDomains",
    deprecated: false

  field :known_suffixes, 3,
    repeated: true,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "knownSuffixes"
end