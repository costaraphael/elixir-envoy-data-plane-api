defmodule Envoy.Extensions.KeyValue.FileBased.V3.FileBasedKeyValueStoreConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filename, 1, type: :string, deprecated: false
  field :flush_interval, 2, type: Google.Protobuf.Duration, json_name: "flushInterval"
  field :max_entries, 3, type: Google.Protobuf.UInt32Value, json_name: "maxEntries"
end