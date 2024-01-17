defmodule Envoy.Extensions.Filters.Listener.TlsInspector.V3.TlsInspector do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :enable_ja3_fingerprinting, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "enableJa3Fingerprinting"

  field :initial_read_buffer_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialReadBufferSize",
    deprecated: false
end