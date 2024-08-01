defmodule Envoy.Extensions.Filters.Network.GenericProxy.Codecs.Http1.V3.Http1CodecConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :single_frame_mode, 1, type: Google.Protobuf.BoolValue, json_name: "singleFrameMode"
  field :max_buffer_size, 2, type: Google.Protobuf.UInt32Value, json_name: "maxBufferSize"
end