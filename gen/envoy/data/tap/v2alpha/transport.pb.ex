defmodule Envoy.Data.Tap.V2alpha.Connection do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :local_address, 2, type: Envoy.Api.V2.Core.Address, json_name: "localAddress"
  field :remote_address, 3, type: Envoy.Api.V2.Core.Address, json_name: "remoteAddress"
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent.Read do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :data, 1, type: Envoy.Data.Tap.V2alpha.Body
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent.Write do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :data, 1, type: Envoy.Data.Tap.V2alpha.Body
  field :end_stream, 2, type: :bool, json_name: "endStream"
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent.Closed do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :event_selector, 0

  field :timestamp, 1, type: Google.Protobuf.Timestamp
  field :read, 2, type: Envoy.Data.Tap.V2alpha.SocketEvent.Read, oneof: 0
  field :write, 3, type: Envoy.Data.Tap.V2alpha.SocketEvent.Write, oneof: 0
  field :closed, 4, type: Envoy.Data.Tap.V2alpha.SocketEvent.Closed, oneof: 0
end

defmodule Envoy.Data.Tap.V2alpha.SocketBufferedTrace do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trace_id, 1, type: :uint64, json_name: "traceId"
  field :connection, 2, type: Envoy.Data.Tap.V2alpha.Connection
  field :events, 3, repeated: true, type: Envoy.Data.Tap.V2alpha.SocketEvent
  field :read_truncated, 4, type: :bool, json_name: "readTruncated"
  field :write_truncated, 5, type: :bool, json_name: "writeTruncated"
end

defmodule Envoy.Data.Tap.V2alpha.SocketStreamedTraceSegment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :message_piece, 0

  field :trace_id, 1, type: :uint64, json_name: "traceId"
  field :connection, 2, type: Envoy.Data.Tap.V2alpha.Connection, oneof: 0
  field :event, 3, type: Envoy.Data.Tap.V2alpha.SocketEvent, oneof: 0
end