defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Dubbo, 0
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Hessian2, 0
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :protocol_type, 2,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType,
    json_name: "protocolType",
    enum: true,
    deprecated: false

  field :serialization_type, 3,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType,
    json_name: "serializationType",
    enum: true,
    deprecated: false

  field :route_config, 4,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteConfiguration,
    json_name: "routeConfig"

  field :dubbo_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter,
    json_name: "dubboFilters"
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Any
end