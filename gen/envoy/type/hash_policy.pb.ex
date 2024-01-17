defmodule Envoy.Type.HashPolicy.SourceIp do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.HashPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :policy_specifier, 0

  field :source_ip, 1, type: Envoy.Type.HashPolicy.SourceIp, json_name: "sourceIp", oneof: 0
end