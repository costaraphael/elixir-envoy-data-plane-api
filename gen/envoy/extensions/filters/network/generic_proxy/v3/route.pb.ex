defmodule Envoy.Extensions.Filters.Network.GenericProxy.V3.VirtualHost do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :hosts, 2, repeated: true, type: :string, deprecated: false
  field :routes, 3, type: Xds.Type.Matcher.V3.Matcher, deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.V3.RouteConfiguration do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :routes, 2, type: Xds.Type.Matcher.V3.Matcher

  field :virtual_hosts, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.GenericProxy.V3.VirtualHost,
    json_name: "virtualHosts"
end