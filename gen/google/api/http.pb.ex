defmodule Google.Api.Http do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, repeated: true, type: Google.Api.HttpRule

  field :fully_decode_reserved_expansion, 2,
    type: :bool,
    json_name: "fullyDecodeReservedExpansion"
end

defmodule Google.Api.HttpRule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :pattern, 0

  field :selector, 1, type: :string
  field :get, 2, type: :string, oneof: 0
  field :put, 3, type: :string, oneof: 0
  field :post, 4, type: :string, oneof: 0
  field :delete, 5, type: :string, oneof: 0
  field :patch, 6, type: :string, oneof: 0
  field :custom, 8, type: Google.Api.CustomHttpPattern, oneof: 0
  field :body, 7, type: :string
  field :response_body, 12, type: :string, json_name: "responseBody"

  field :additional_bindings, 11,
    repeated: true,
    type: Google.Api.HttpRule,
    json_name: "additionalBindings"
end

defmodule Google.Api.CustomHttpPattern do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :kind, 1, type: :string
  field :path, 2, type: :string
end