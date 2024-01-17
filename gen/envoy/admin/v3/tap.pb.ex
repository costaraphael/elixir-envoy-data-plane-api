defmodule Envoy.Admin.V3.TapRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_id, 1, type: :string, json_name: "configId", deprecated: false

  field :tap_config, 2,
    type: Envoy.Config.Tap.V3.TapConfig,
    json_name: "tapConfig",
    deprecated: false
end