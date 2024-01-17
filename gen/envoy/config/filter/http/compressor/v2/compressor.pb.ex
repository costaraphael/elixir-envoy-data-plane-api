defmodule Envoy.Config.Filter.Http.Compressor.V2.Compressor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :content_length, 1, type: Google.Protobuf.UInt32Value, json_name: "contentLength"
  field :content_type, 2, repeated: true, type: :string, json_name: "contentType"
  field :disable_on_etag_header, 3, type: :bool, json_name: "disableOnEtagHeader"
  field :remove_accept_encoding_header, 4, type: :bool, json_name: "removeAcceptEncodingHeader"

  field :runtime_enabled, 5,
    type: Envoy.Api.V2.Core.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end