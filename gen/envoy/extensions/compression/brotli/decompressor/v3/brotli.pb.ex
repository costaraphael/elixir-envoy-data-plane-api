defmodule Envoy.Extensions.Compression.Brotli.Decompressor.V3.Brotli do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :disable_ring_buffer_reallocation, 1,
    type: :bool,
    json_name: "disableRingBufferReallocation"

  field :chunk_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false
end