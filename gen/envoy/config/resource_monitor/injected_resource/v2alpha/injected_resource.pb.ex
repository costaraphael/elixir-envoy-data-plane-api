defmodule Envoy.Config.ResourceMonitor.InjectedResource.V2alpha.InjectedResourceConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filename, 1, type: :string, deprecated: false
end