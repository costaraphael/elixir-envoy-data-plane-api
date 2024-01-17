defmodule Envoy.Type.CodecClientType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :HTTP1, 0
  field :HTTP2, 1
  field :HTTP3, 2
end