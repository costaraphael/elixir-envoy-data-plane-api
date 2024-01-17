defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Dubbo, 0
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Hessian2, 0
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.Drds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :route_config_name, 2, type: :string, json_name: "routeConfigName"
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :protocol_type, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType,
    json_name: "protocolType",
    enum: true,
    deprecated: false

  field :serialization_type, 3,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType,
    json_name: "serializationType",
    enum: true,
    deprecated: false

  field :route_config, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration,
    json_name: "routeConfig",
    deprecated: true

  field :drds, 6,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.Drds,
    oneof: 0,
    deprecated: false

  field :multiple_route_config, 7,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MultipleRouteConfiguration,
    json_name: "multipleRouteConfig",
    oneof: 0

  field :dubbo_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter,
    json_name: "dubboFilters"
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Any
end