defmodule Envoy.Admin.V2alpha.Memory do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allocated, 1, type: :uint64
  field :heap_size, 2, type: :uint64, json_name: "heapSize"
  field :pageheap_unmapped, 3, type: :uint64, json_name: "pageheapUnmapped"
  field :pageheap_free, 4, type: :uint64, json_name: "pageheapFree"
  field :total_thread_cache, 5, type: :uint64, json_name: "totalThreadCache"
  field :total_physical_bytes, 6, type: :uint64, json_name: "totalPhysicalBytes"
end