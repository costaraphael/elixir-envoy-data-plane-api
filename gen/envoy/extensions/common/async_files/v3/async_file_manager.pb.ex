defmodule Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig.ThreadPool do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :thread_count, 1, type: :uint32, json_name: "threadCount", deprecated: false
end

defmodule Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :manager_type, 0

  field :id, 1, type: :string

  field :thread_pool, 2,
    type: Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig.ThreadPool,
    json_name: "threadPool",
    oneof: 0
end