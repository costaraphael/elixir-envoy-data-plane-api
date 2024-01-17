defmodule Envoy.Extensions.Http.EarlyHeaderMutation.HeaderMutation.V3.HeaderMutation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :mutations, 1,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    deprecated: false
end