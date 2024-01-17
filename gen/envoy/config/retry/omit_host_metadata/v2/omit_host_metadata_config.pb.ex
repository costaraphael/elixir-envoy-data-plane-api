defmodule Envoy.Config.Retry.OmitHostMetadata.V2.OmitHostMetadataConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata_match, 1, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
end