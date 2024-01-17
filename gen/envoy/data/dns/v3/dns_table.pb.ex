defmodule Envoy.Data.Dns.V3.DnsTable.AddressList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :protocol_config, 0

  field :number, 1, type: :uint32, oneof: 0, deprecated: false
  field :name, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :endpoint_type, 0

  field :host_name, 1, type: :string, json_name: "hostName", oneof: 0, deprecated: false
  field :cluster_name, 2, type: :string, json_name: "clusterName", oneof: 0, deprecated: false
  field :priority, 3, type: :uint32, deprecated: false
  field :weight, 4, type: :uint32, deprecated: false
  field :port, 5, type: :uint32, deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsService do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :protocol, 2, type: Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol
  field :ttl, 3, type: Google.Protobuf.Duration, deprecated: false

  field :targets, 4,
    repeated: true,
    type: Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget,
    deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :services, 1,
    repeated: true,
    type: Envoy.Data.Dns.V3.DnsTable.DnsService,
    deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsEndpoint do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :endpoint_config, 0

  field :address_list, 1,
    type: Envoy.Data.Dns.V3.DnsTable.AddressList,
    json_name: "addressList",
    oneof: 0

  field :cluster_name, 2, type: :string, json_name: "clusterName", oneof: 0

  field :service_list, 3,
    type: Envoy.Data.Dns.V3.DnsTable.DnsServiceList,
    json_name: "serviceList",
    oneof: 0
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :endpoint, 2, type: Envoy.Data.Dns.V3.DnsTable.DnsEndpoint
  field :answer_ttl, 3, type: Google.Protobuf.Duration, json_name: "answerTtl", deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :external_retry_count, 1,
    type: :uint32,
    json_name: "externalRetryCount",
    deprecated: false

  field :virtual_domains, 2,
    repeated: true,
    type: Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain,
    json_name: "virtualDomains"

  field :known_suffixes, 3,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "knownSuffixes",
    deprecated: true
end