defmodule Envoy.Extensions.Filters.Http.Composite.V3.Composite do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.DynamicConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :config_discovery, 2,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery"
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.ExecuteFilterAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :typed_config, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedConfig",
    deprecated: false

  field :dynamic_config, 2,
    type: Envoy.Extensions.Filters.Http.Composite.V3.DynamicConfig,
    json_name: "dynamicConfig",
    deprecated: false
end