defmodule Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :admin_config, 1,
    type: Envoy.Config.Common.Tap.V2alpha.AdminConfig,
    json_name: "adminConfig",
    oneof: 0

  field :static_config, 2,
    type: Envoy.Service.Tap.V2alpha.TapConfig,
    json_name: "staticConfig",
    oneof: 0
end

defmodule Envoy.Config.Common.Tap.V2alpha.AdminConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_id, 1, type: :string, json_name: "configId", deprecated: false
end