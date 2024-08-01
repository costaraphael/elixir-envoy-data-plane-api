defmodule Envoy.Config.Core.V3.SocketOption.SocketState do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :STATE_PREBIND, 0
  field :STATE_BOUND, 1
  field :STATE_LISTENING, 2
end

defmodule Envoy.Config.Core.V3.SocketOption.SocketType.Stream do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Core.V3.SocketOption.SocketType.Datagram do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Core.V3.SocketOption.SocketType do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stream, 1, type: Envoy.Config.Core.V3.SocketOption.SocketType.Stream
  field :datagram, 2, type: Envoy.Config.Core.V3.SocketOption.SocketType.Datagram
end

defmodule Envoy.Config.Core.V3.SocketOption do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :description, 1, type: :string
  field :level, 2, type: :int64
  field :name, 3, type: :int64
  field :int_value, 4, type: :int64, json_name: "intValue", oneof: 0
  field :buf_value, 5, type: :bytes, json_name: "bufValue", oneof: 0

  field :state, 6,
    type: Envoy.Config.Core.V3.SocketOption.SocketState,
    enum: true,
    deprecated: false

  field :type, 7, type: Envoy.Config.Core.V3.SocketOption.SocketType
end

defmodule Envoy.Config.Core.V3.SocketOptionsOverride do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :socket_options, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"
end