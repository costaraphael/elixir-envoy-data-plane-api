defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.GrpcFieldExtractionConfig.ExtractionsByMethodEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.GrpcFieldExtractionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptor_set, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "descriptorSet",
    deprecated: false

  field :extractions_by_method, 2,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.GrpcFieldExtractionConfig.ExtractionsByMethodEntry,
    json_name: "extractionsByMethod",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions.RequestFieldExtractionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string

  field :value, 2,
    type: Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.RequestFieldValueDisposition
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_field_extractions, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions.RequestFieldExtractionsEntry,
    json_name: "requestFieldExtractions",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.RequestFieldValueDisposition do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :disposition, 0

  field :dynamic_metadata, 1, type: :string, json_name: "dynamicMetadata", oneof: 0
end