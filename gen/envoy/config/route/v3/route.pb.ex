defmodule Envoy.Config.Route.V3.RouteConfiguration.TypedPerFilterConfigEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.RouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :virtual_hosts, 2,
    repeated: true,
    type: Envoy.Config.Route.V3.VirtualHost,
    json_name: "virtualHosts"

  field :vhds, 9, type: Envoy.Config.Route.V3.Vhds

  field :internal_only_headers, 3,
    repeated: true,
    type: :string,
    json_name: "internalOnlyHeaders",
    deprecated: false

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 5,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :request_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 8,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :most_specific_header_mutations_wins, 10,
    type: :bool,
    json_name: "mostSpecificHeaderMutationsWins"

  field :validate_clusters, 7, type: Google.Protobuf.BoolValue, json_name: "validateClusters"

  field :max_direct_response_body_size_bytes, 11,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxDirectResponseBodySizeBytes"

  field :cluster_specifier_plugins, 12,
    repeated: true,
    type: Envoy.Config.Route.V3.ClusterSpecifierPlugin,
    json_name: "clusterSpecifierPlugins"

  field :request_mirror_policies, 13,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :ignore_port_in_host_matching, 14, type: :bool, json_name: "ignorePortInHostMatching"

  field :ignore_path_parameters_in_path_matching, 15,
    type: :bool,
    json_name: "ignorePathParametersInPathMatching"

  field :typed_per_filter_config, 16,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteConfiguration.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :metadata, 17, type: Envoy.Config.Core.V3.Metadata
end

defmodule Envoy.Config.Route.V3.Vhds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false
end