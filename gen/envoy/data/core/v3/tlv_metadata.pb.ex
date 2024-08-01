defmodule Envoy.Data.Core.V3.TlvsMetadata.TypedMetadataEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :bytes
end

defmodule Envoy.Data.Core.V3.TlvsMetadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :typed_metadata, 1,
    repeated: true,
    type: Envoy.Data.Core.V3.TlvsMetadata.TypedMetadataEntry,
    json_name: "typedMetadata",
    map: true
end