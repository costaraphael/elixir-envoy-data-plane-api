defmodule Envoy.Extensions.Compression.Gzip.Decompressor.V3.Gzip do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :window_bits, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "windowBits",
    deprecated: false

  field :chunk_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false

  field :max_inflate_ratio, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInflateRatio",
    deprecated: false
end