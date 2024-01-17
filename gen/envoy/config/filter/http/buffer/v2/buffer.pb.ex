defmodule Envoy.Config.Filter.Http.Buffer.V2.Buffer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_request_bytes, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBytes",
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.Buffer.V2.BufferPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :buffer, 2, type: Envoy.Config.Filter.Http.Buffer.V2.Buffer, oneof: 0, deprecated: false
end