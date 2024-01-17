defmodule Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.DependencyType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :HEADER, 0
  field :FILTER_STATE_KEY, 1
  field :DYNAMIC_METADATA, 2
end

defmodule Envoy.Extensions.Filters.Common.Dependency.V3.Dependency do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.DependencyType,
    enum: true

  field :name, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Common.Dependency.V3.FilterDependencies do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :decode_required, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency,
    json_name: "decodeRequired"

  field :decode_provided, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency,
    json_name: "decodeProvided"

  field :encode_required, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency,
    json_name: "encodeRequired"

  field :encode_provided, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency,
    json_name: "encodeProvided"
end

defmodule Envoy.Extensions.Filters.Common.Dependency.V3.MatchingRequirements.DataInputAllowList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type_url, 1, repeated: true, type: :string, json_name: "typeUrl"
end

defmodule Envoy.Extensions.Filters.Common.Dependency.V3.MatchingRequirements do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :data_input_allow_list, 1,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.MatchingRequirements.DataInputAllowList,
    json_name: "dataInputAllowList"
end