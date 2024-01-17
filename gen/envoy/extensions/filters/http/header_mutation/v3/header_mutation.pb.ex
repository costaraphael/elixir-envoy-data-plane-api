defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_mutations, 1,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "requestMutations"

  field :response_mutations, 2,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "responseMutations"
end

defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.HeaderMutationPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :mutations, 1, type: Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations
end

defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.HeaderMutation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :mutations, 1, type: Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations

  field :most_specific_header_mutations_wins, 2,
    type: :bool,
    json_name: "mostSpecificHeaderMutationsWins"
end