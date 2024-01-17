defmodule Envoy.Admin.V2alpha.SimpleMetric.Type do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :COUNTER, 0
  field :GAUGE, 1
end

defmodule Envoy.Admin.V2alpha.SimpleMetric do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1, type: Envoy.Admin.V2alpha.SimpleMetric.Type, enum: true
  field :value, 2, type: :uint64
  field :name, 3, type: :string
end