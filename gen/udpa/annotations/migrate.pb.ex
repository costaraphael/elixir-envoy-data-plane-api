defmodule Udpa.Annotations.MigrateAnnotation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rename, 1, type: :string
end

defmodule Udpa.Annotations.FieldMigrateAnnotation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rename, 1, type: :string
  field :oneof_promotion, 2, type: :string, json_name: "oneofPromotion"
end

defmodule Udpa.Annotations.FileMigrateAnnotation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :move_to_package, 2, type: :string, json_name: "moveToPackage"
end