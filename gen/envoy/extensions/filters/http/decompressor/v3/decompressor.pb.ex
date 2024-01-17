defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag
  field :ignore_no_transform_header, 2, type: :bool, json_name: "ignoreNoTransformHeader"
end

defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.RequestDirectionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig,
    json_name: "commonConfig"

  field :advertise_accept_encoding, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "advertiseAcceptEncoding"
end

defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.ResponseDirectionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig,
    json_name: "commonConfig"
end

defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :decompressor_library, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "decompressorLibrary",
    deprecated: false

  field :request_direction_config, 2,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.RequestDirectionConfig,
    json_name: "requestDirectionConfig"

  field :response_direction_config, 3,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.ResponseDirectionConfig,
    json_name: "responseDirectionConfig"
end