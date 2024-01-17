defmodule Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :admin_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.AdminConfig,
    json_name: "adminConfig",
    oneof: 0

  field :static_config, 2,
    type: Envoy.Config.Tap.V3.TapConfig,
    json_name: "staticConfig",
    oneof: 0
end

defmodule Envoy.Extensions.Common.Tap.V3.AdminConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_id, 1, type: :string, json_name: "configId", deprecated: false
end