defmodule Envoy.Config.Listener.V3.FilterChainMatch.ConnectionSourceType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ANY, 0
  field :SAME_IP_OR_LOOPBACK, 1
  field :EXTERNAL, 2
end

defmodule Envoy.Config.Listener.V3.Filter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0

  field :config_discovery, 5,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery",
    oneof: 0
end

defmodule Envoy.Config.Listener.V3.FilterChainMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :destination_port, 8,
    type: Google.Protobuf.UInt32Value,
    json_name: "destinationPort",
    deprecated: false

  field :prefix_ranges, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "prefixRanges"

  field :address_suffix, 4, type: :string, json_name: "addressSuffix"
  field :suffix_len, 5, type: Google.Protobuf.UInt32Value, json_name: "suffixLen"

  field :direct_source_prefix_ranges, 13,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "directSourcePrefixRanges"

  field :source_type, 12,
    type: Envoy.Config.Listener.V3.FilterChainMatch.ConnectionSourceType,
    json_name: "sourceType",
    enum: true,
    deprecated: false

  field :source_prefix_ranges, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "sourcePrefixRanges"

  field :source_ports, 7,
    repeated: true,
    type: :uint32,
    json_name: "sourcePorts",
    deprecated: false

  field :server_names, 11, repeated: true, type: :string, json_name: "serverNames"
  field :transport_protocol, 9, type: :string, json_name: "transportProtocol"

  field :application_protocols, 10,
    repeated: true,
    type: :string,
    json_name: "applicationProtocols"
end

defmodule Envoy.Config.Listener.V3.FilterChain.OnDemandConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rebuild_timeout, 1, type: Google.Protobuf.Duration, json_name: "rebuildTimeout"
end

defmodule Envoy.Config.Listener.V3.FilterChain do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter_chain_match, 1,
    type: Envoy.Config.Listener.V3.FilterChainMatch,
    json_name: "filterChainMatch"

  field :filters, 3, repeated: true, type: Envoy.Config.Listener.V3.Filter

  field :use_proxy_proto, 4,
    type: Google.Protobuf.BoolValue,
    json_name: "useProxyProto",
    deprecated: true

  field :metadata, 5, type: Envoy.Config.Core.V3.Metadata

  field :transport_socket, 6,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket"

  field :transport_socket_connect_timeout, 9,
    type: Google.Protobuf.Duration,
    json_name: "transportSocketConnectTimeout"

  field :name, 7, type: :string

  field :on_demand_configuration, 8,
    type: Envoy.Config.Listener.V3.FilterChain.OnDemandConfiguration,
    json_name: "onDemandConfiguration"
end

defmodule Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate.MatchSet do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1,
    repeated: true,
    type: Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate,
    deprecated: false
end

defmodule Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :or_match, 1,
    type: Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate.MatchSet,
    json_name: "orMatch",
    oneof: 0

  field :and_match, 2,
    type: Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate.MatchSet,
    json_name: "andMatch",
    oneof: 0

  field :not_match, 3,
    type: Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate,
    json_name: "notMatch",
    oneof: 0

  field :any_match, 4, type: :bool, json_name: "anyMatch", oneof: 0, deprecated: false

  field :destination_port_range, 5,
    type: Envoy.Type.V3.Int32Range,
    json_name: "destinationPortRange",
    oneof: 0
end

defmodule Envoy.Config.Listener.V3.ListenerFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0

  field :config_discovery, 5,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery",
    oneof: 0

  field :filter_disabled, 4,
    type: Envoy.Config.Listener.V3.ListenerFilterChainMatchPredicate,
    json_name: "filterDisabled"
end