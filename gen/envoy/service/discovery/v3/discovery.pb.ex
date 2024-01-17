defmodule Envoy.Service.Discovery.V3.ResourceLocator.DynamicParametersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Discovery.V3.ResourceLocator do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :dynamic_parameters, 2,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator.DynamicParametersEntry,
    json_name: "dynamicParameters",
    map: true
end

defmodule Envoy.Service.Discovery.V3.ResourceName do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string

  field :dynamic_parameter_constraints, 2,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints,
    json_name: "dynamicParameterConstraints"
end

defmodule Envoy.Service.Discovery.V3.DiscoveryRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :node, 2, type: Envoy.Config.Core.V3.Node
  field :resource_names, 3, repeated: true, type: :string, json_name: "resourceNames"

  field :resource_locators, 7,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator,
    json_name: "resourceLocators"

  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :response_nonce, 5, type: :string, json_name: "responseNonce"
  field :error_detail, 6, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Service.Discovery.V3.DiscoveryResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :resources, 2, repeated: true, type: Google.Protobuf.Any
  field :canary, 3, type: :bool
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :nonce, 5, type: :string
  field :control_plane, 6, type: Envoy.Config.Core.V3.ControlPlane, json_name: "controlPlane"
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :type_url, 2, type: :string, json_name: "typeUrl"

  field :resource_names_subscribe, 3,
    repeated: true,
    type: :string,
    json_name: "resourceNamesSubscribe"

  field :resource_names_unsubscribe, 4,
    repeated: true,
    type: :string,
    json_name: "resourceNamesUnsubscribe"

  field :resource_locators_subscribe, 8,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator,
    json_name: "resourceLocatorsSubscribe"

  field :resource_locators_unsubscribe, 9,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator,
    json_name: "resourceLocatorsUnsubscribe"

  field :initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Service.Discovery.V3.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    json_name: "initialResourceVersions",
    map: true

  field :response_nonce, 6, type: :string, json_name: "responseNonce"
  field :error_detail, 7, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :system_version_info, 1, type: :string, json_name: "systemVersionInfo"
  field :resources, 2, repeated: true, type: Envoy.Service.Discovery.V3.Resource
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :removed_resources, 6, repeated: true, type: :string, json_name: "removedResources"

  field :removed_resource_names, 8,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceName,
    json_name: "removedResourceNames"

  field :nonce, 5, type: :string
  field :control_plane, 7, type: Envoy.Config.Core.V3.ControlPlane, json_name: "controlPlane"
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint.Exists do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :constraint_type, 0

  field :key, 1, type: :string
  field :value, 2, type: :string, oneof: 0

  field :exists, 3,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint.Exists,
    oneof: 0
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints.ConstraintList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :constraints, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :constraint, 1,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint,
    oneof: 0

  field :or_constraints, 2,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.ConstraintList,
    json_name: "orConstraints",
    oneof: 0

  field :and_constraints, 3,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.ConstraintList,
    json_name: "andConstraints",
    oneof: 0

  field :not_constraints, 4,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints,
    json_name: "notConstraints",
    oneof: 0
end

defmodule Envoy.Service.Discovery.V3.Resource.CacheControl do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :do_not_cache, 1, type: :bool, json_name: "doNotCache"
end

defmodule Envoy.Service.Discovery.V3.Resource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 3, type: :string

  field :resource_name, 8,
    type: Envoy.Service.Discovery.V3.ResourceName,
    json_name: "resourceName"

  field :aliases, 4, repeated: true, type: :string
  field :version, 1, type: :string
  field :resource, 2, type: Google.Protobuf.Any
  field :ttl, 6, type: Google.Protobuf.Duration

  field :cache_control, 7,
    type: Envoy.Service.Discovery.V3.Resource.CacheControl,
    json_name: "cacheControl"

  field :metadata, 9, type: Envoy.Config.Core.V3.Metadata
end