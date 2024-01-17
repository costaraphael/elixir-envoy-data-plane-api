defmodule Opencensus.Proto.Resource.V1.Resource.LabelsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Opencensus.Proto.Resource.V1.Resource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1, type: :string

  field :labels, 2,
    repeated: true,
    type: Opencensus.Proto.Resource.V1.Resource.LabelsEntry,
    map: true
end