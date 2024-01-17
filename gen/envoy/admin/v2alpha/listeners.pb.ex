defmodule Envoy.Admin.V2alpha.Listeners do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :listener_statuses, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenerStatus,
    json_name: "listenerStatuses"
end

defmodule Envoy.Admin.V2alpha.ListenerStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :local_address, 2, type: Envoy.Api.V2.Core.Address, json_name: "localAddress"
end