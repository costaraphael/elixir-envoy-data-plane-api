defmodule Xds.Annotations.V3.PbExtension do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.12.0"

  extend Google.Protobuf.FileOptions, :file_status, 226_829_418,
    optional: true,
    type: Xds.Annotations.V3.FileStatusAnnotation,
    json_name: "fileStatus"

  extend Google.Protobuf.MessageOptions, :message_status, 226_829_418,
    optional: true,
    type: Xds.Annotations.V3.MessageStatusAnnotation,
    json_name: "messageStatus"

  extend Google.Protobuf.FieldOptions, :field_status, 226_829_418,
    optional: true,
    type: Xds.Annotations.V3.FieldStatusAnnotation,
    json_name: "fieldStatus"
end