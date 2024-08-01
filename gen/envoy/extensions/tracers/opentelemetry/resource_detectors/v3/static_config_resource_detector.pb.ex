defmodule Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.StaticConfigResourceDetectorConfig.AttributesEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.StaticConfigResourceDetectorConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1,
    repeated: true,
    type:
      Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.StaticConfigResourceDetectorConfig.AttributesEntry,
    map: true
end