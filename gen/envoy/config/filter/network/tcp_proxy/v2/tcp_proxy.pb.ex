defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1.TCPRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false

  field :destination_ip_list, 2,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "destinationIpList"

  field :destination_ports, 3, type: :string, json_name: "destinationPorts"

  field :source_ip_list, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "sourceIpList"

  field :source_ports, 5, type: :string, json_name: "sourcePorts"
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1 do
  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :routes, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1.TCPRoute,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster.ClusterWeight do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: :uint32, deprecated: false
  field :metadata_match, 3, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clusters, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster.ClusterWeight,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.TunnelingConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :hostname, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :cluster_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0

  field :weighted_clusters, 10,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :metadata_match, 9, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
  field :idle_timeout, 8, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :downstream_idle_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "downstreamIdleTimeout"

  field :upstream_idle_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "upstreamIdleTimeout"

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLog,
    json_name: "accessLog"

  field :deprecated_v1, 6,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1,
    json_name: "deprecatedV1",
    deprecated: true

  field :max_connect_attempts, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts",
    deprecated: false

  field :hash_policy, 11,
    repeated: true,
    type: Envoy.Type.HashPolicy,
    json_name: "hashPolicy",
    deprecated: false

  field :tunneling_config, 12,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.TunnelingConfig,
    json_name: "tunnelingConfig"
end