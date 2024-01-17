defmodule Envoy.Extensions.RateLimitDescriptors.Expr.V3.Descriptor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :expr_specifier, 0

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false
  field :skip_if_error, 2, type: :bool, json_name: "skipIfError"
  field :text, 3, type: :string, oneof: 0, deprecated: false
  field :parsed, 4, type: Google.Api.Expr.V1alpha1.Expr, oneof: 0
end