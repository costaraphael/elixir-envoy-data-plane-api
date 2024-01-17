defmodule Envoy.Extensions.Filters.Http.OriginalSrc.V3.OriginalSrc do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :mark, 1, type: :uint32
end