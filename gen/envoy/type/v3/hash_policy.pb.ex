defmodule Envoy.Type.V3.HashPolicy.SourceIp do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.V3.HashPolicy.FilterState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Type.V3.HashPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :policy_specifier, 0

  field :source_ip, 1, type: Envoy.Type.V3.HashPolicy.SourceIp, json_name: "sourceIp", oneof: 0

  field :filter_state, 2,
    type: Envoy.Type.V3.HashPolicy.FilterState,
    json_name: "filterState",
    oneof: 0
end