defmodule Envoy.Extensions.Filters.Network.GenericProxy.V3.GenericProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :codec_config, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "codecConfig",
    deprecated: false

  field :generic_rds, 3,
    type: Envoy.Extensions.Filters.Network.GenericProxy.V3.GenericRds,
    json_name: "genericRds",
    oneof: 0

  field :route_config, 4,
    type: Envoy.Extensions.Filters.Network.GenericProxy.V3.RouteConfiguration,
    json_name: "routeConfig",
    oneof: 0

  field :filters, 5, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig

  field :tracing, 6,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing

  field :access_log, 7,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.V3.GenericRds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :route_config_name, 2, type: :string, json_name: "routeConfigName", deprecated: false
end