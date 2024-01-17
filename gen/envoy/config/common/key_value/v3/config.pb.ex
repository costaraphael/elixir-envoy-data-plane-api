defmodule Envoy.Config.Common.KeyValue.V3.KeyValueStoreConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end