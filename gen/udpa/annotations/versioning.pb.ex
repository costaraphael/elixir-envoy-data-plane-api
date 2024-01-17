defmodule Udpa.Annotations.VersioningAnnotation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :previous_message_type, 1, type: :string, json_name: "previousMessageType"
end