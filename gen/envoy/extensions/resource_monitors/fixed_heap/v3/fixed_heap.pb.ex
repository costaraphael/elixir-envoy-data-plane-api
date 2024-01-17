defmodule Envoy.Extensions.ResourceMonitors.FixedHeap.V3.FixedHeapConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_heap_size_bytes, 1, type: :uint64, json_name: "maxHeapSizeBytes", deprecated: false
end