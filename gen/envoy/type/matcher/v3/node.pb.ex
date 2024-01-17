defmodule Envoy.Type.Matcher.V3.NodeMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_id, 1, type: Envoy.Type.Matcher.V3.StringMatcher, json_name: "nodeId"

  field :node_metadatas, 2,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StructMatcher,
    json_name: "nodeMetadatas"
end