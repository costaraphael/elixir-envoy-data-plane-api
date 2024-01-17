defmodule Envoy.Extensions.Compression.Zstd.Compressor.V3.Zstd.Strategy do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :FAST, 1
  field :DFAST, 2
  field :GREEDY, 3
  field :LAZY, 4
  field :LAZY2, 5
  field :BTLAZY2, 6
  field :BTOPT, 7
  field :BTULTRA, 8
  field :BTULTRA2, 9
end

defmodule Envoy.Extensions.Compression.Zstd.Compressor.V3.Zstd do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :compression_level, 1, type: Google.Protobuf.UInt32Value, json_name: "compressionLevel"
  field :enable_checksum, 2, type: :bool, json_name: "enableChecksum"

  field :strategy, 3,
    type: Envoy.Extensions.Compression.Zstd.Compressor.V3.Zstd.Strategy,
    enum: true,
    deprecated: false

  field :dictionary, 4, type: Envoy.Config.Core.V3.DataSource

  field :chunk_size, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false
end