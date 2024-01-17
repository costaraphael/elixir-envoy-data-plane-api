defmodule Envoy.Extensions.Retry.Host.OmitHostMetadata.V3.OmitHostMetadataConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata_match, 1, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end