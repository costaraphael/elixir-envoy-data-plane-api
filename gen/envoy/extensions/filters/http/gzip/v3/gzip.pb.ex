defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionStrategy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :FILTERED, 1
  field :HUFFMAN, 2
  field :RLE, 3
end

defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionLevel.Enum do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :BEST, 1
  field :SPEED, 2
end

defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionLevel do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :memory_level, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "memoryLevel",
    deprecated: false

  field :compression_level, 3,
    type: Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionLevel.Enum,
    json_name: "compressionLevel",
    enum: true,
    deprecated: false

  field :compression_strategy, 4,
    type: Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionStrategy,
    json_name: "compressionStrategy",
    enum: true,
    deprecated: false

  field :window_bits, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "windowBits",
    deprecated: false

  field :compressor, 10, type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor

  field :chunk_size, 11,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false
end