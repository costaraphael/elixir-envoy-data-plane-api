defmodule Envoy.Api.V2.Core.GrpcMethodList.Service do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :method_names, 2,
    repeated: true,
    type: :string,
    json_name: "methodNames",
    deprecated: false
end

defmodule Envoy.Api.V2.Core.GrpcMethodList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :services, 1, repeated: true, type: Envoy.Api.V2.Core.GrpcMethodList.Service
end