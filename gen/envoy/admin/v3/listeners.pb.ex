defmodule Envoy.Admin.V3.Listeners do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :listener_statuses, 1,
    repeated: true,
    type: Envoy.Admin.V3.ListenerStatus,
    json_name: "listenerStatuses"
end

defmodule Envoy.Admin.V3.ListenerStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :local_address, 2, type: Envoy.Config.Core.V3.Address, json_name: "localAddress"

  field :additional_local_addresses, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "additionalLocalAddresses"
end