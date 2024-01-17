defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag
  field :min_content_length, 2, type: Google.Protobuf.UInt32Value, json_name: "minContentLength"
  field :content_type, 3, repeated: true, type: :string, json_name: "contentType"
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig,
    json_name: "commonConfig"
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig,
    json_name: "commonConfig"

  field :disable_on_etag_header, 2, type: :bool, json_name: "disableOnEtagHeader"
  field :remove_accept_encoding_header, 3, type: :bool, json_name: "removeAcceptEncodingHeader"
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :content_length, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "contentLength",
    deprecated: true

  field :content_type, 2,
    repeated: true,
    type: :string,
    json_name: "contentType",
    deprecated: true

  field :disable_on_etag_header, 3,
    type: :bool,
    json_name: "disableOnEtagHeader",
    deprecated: true

  field :remove_accept_encoding_header, 4,
    type: :bool,
    json_name: "removeAcceptEncodingHeader",
    deprecated: true

  field :runtime_enabled, 5,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled",
    deprecated: true

  field :compressor_library, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "compressorLibrary",
    deprecated: false

  field :request_direction_config, 7,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig,
    json_name: "requestDirectionConfig"

  field :response_direction_config, 8,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig,
    json_name: "responseDirectionConfig"

  field :choose_first, 9, type: :bool, json_name: "chooseFirst"
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.ResponseDirectionOverrides do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :remove_accept_encoding_header, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "removeAcceptEncodingHeader"
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.CompressorOverrides do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :response_direction_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.ResponseDirectionOverrides,
    json_name: "responseDirectionConfig"
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.CompressorPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :overrides, 2,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.CompressorOverrides,
    oneof: 0
end