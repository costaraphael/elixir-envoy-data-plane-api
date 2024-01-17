defmodule Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemandCds do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :source, 1, type: Envoy.Config.Core.V3.ConfigSource, deprecated: false
  field :resources_locator, 2, type: :string, json_name: "resourcesLocator"
  field :timeout, 3, type: Google.Protobuf.Duration
end

defmodule Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemand do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :odcds, 1, type: Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemandCds
end

defmodule Envoy.Extensions.Filters.Http.OnDemand.V3.PerRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :odcds, 1, type: Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemandCds
end