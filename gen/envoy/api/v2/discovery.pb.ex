defmodule Envoy.Api.V2.DiscoveryRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :node, 2, type: Envoy.Api.V2.Core.Node
  field :resource_names, 3, repeated: true, type: :string, json_name: "resourceNames"
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :response_nonce, 5, type: :string, json_name: "responseNonce"
  field :error_detail, 6, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Api.V2.DiscoveryResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :resources, 2, repeated: true, type: Google.Protobuf.Any
  field :canary, 3, type: :bool
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :nonce, 5, type: :string
  field :control_plane, 6, type: Envoy.Api.V2.Core.ControlPlane, json_name: "controlPlane"
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node
  field :type_url, 2, type: :string, json_name: "typeUrl"

  field :resource_names_subscribe, 3,
    repeated: true,
    type: :string,
    json_name: "resourceNamesSubscribe"

  field :resource_names_unsubscribe, 4,
    repeated: true,
    type: :string,
    json_name: "resourceNamesUnsubscribe"

  field :initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    json_name: "initialResourceVersions",
    map: true

  field :response_nonce, 6, type: :string, json_name: "responseNonce"
  field :error_detail, 7, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Api.V2.DeltaDiscoveryResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :system_version_info, 1, type: :string, json_name: "systemVersionInfo"
  field :resources, 2, repeated: true, type: Envoy.Api.V2.Resource
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :removed_resources, 6, repeated: true, type: :string, json_name: "removedResources"
  field :nonce, 5, type: :string
end

defmodule Envoy.Api.V2.Resource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 3, type: :string
  field :aliases, 4, repeated: true, type: :string
  field :version, 1, type: :string
  field :resource, 2, type: Google.Protobuf.Any
end