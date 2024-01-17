defmodule Envoy.Api.V2.Core.SocketOption.SocketState do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :STATE_PREBIND, 0
  field :STATE_BOUND, 1
  field :STATE_LISTENING, 2
end

defmodule Envoy.Api.V2.Core.SocketOption do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :description, 1, type: :string
  field :level, 2, type: :int64
  field :name, 3, type: :int64
  field :int_value, 4, type: :int64, json_name: "intValue", oneof: 0
  field :buf_value, 5, type: :bytes, json_name: "bufValue", oneof: 0
  field :state, 6, type: Envoy.Api.V2.Core.SocketOption.SocketState, enum: true, deprecated: false
end