defmodule Envoy.Extensions.Clusters.Aggregate.V3.ClusterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clusters, 1, repeated: true, type: :string, deprecated: false
end