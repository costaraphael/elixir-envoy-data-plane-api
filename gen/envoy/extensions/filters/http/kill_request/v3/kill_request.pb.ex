defmodule Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest.Direction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :REQUEST, 0
  field :RESPONSE, 1
end

defmodule Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :probability, 1, type: Envoy.Type.V3.FractionalPercent
  field :kill_request_header, 2, type: :string, json_name: "killRequestHeader", deprecated: false

  field :direction, 3,
    type: Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest.Direction,
    enum: true,
    deprecated: false
end