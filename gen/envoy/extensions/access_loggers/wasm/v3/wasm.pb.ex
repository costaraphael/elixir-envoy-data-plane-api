defmodule Envoy.Extensions.AccessLoggers.Wasm.V3.WasmAccessLog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
end