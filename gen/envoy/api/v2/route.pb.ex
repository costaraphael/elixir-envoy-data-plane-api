defmodule Envoy.Api.V2.RouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :virtual_hosts, 2,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost,
    json_name: "virtualHosts"

  field :vhds, 9, type: Envoy.Api.V2.Vhds

  field :internal_only_headers, 3,
    repeated: true,
    type: :string,
    json_name: "internalOnlyHeaders",
    deprecated: false

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 5,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :request_headers_to_add, 6,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
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
end

defmodule Envoy.Api.V2.Vhds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_source, 1,
    type: Envoy.Api.V2.Core.ConfigSource,
    json_name: "configSource",
    deprecated: false
end