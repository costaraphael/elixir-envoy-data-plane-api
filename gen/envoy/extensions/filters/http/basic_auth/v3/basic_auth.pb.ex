defmodule Envoy.Extensions.Filters.Http.BasicAuth.V3.BasicAuth do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :users, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
end