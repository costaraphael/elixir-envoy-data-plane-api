defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO_TRANSPORT, 0
  field :FRAMED, 1
  field :UNFRAMED, 2
  field :HEADER, 3
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO_PROTOCOL, 0
  field :BINARY, 1
  field :LAX_BINARY, 2
  field :COMPACT, 3
  field :TWITTER, 4
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :transport, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 3,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType,
    enum: true,
    deprecated: false

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :route_config, 4,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteConfiguration,
    json_name: "routeConfig"

  field :thrift_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftFilter,
    json_name: "thriftFilters"
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftFilter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :transport, 1,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType,
    enum: true,
    deprecated: false
end