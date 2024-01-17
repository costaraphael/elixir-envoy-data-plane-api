defmodule Udpa.Annotations.PbExtension do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.12.0"

  extend Google.Protobuf.FileOptions, :file_status, 222_707_719,
    optional: true,
    type: Udpa.Annotations.StatusAnnotation,
    json_name: "fileStatus"

  extend Google.Protobuf.MessageOptions, :message_migrate, 171_962_766,
    optional: true,
    type: Udpa.Annotations.MigrateAnnotation,
    json_name: "messageMigrate"

  extend Google.Protobuf.FieldOptions, :field_migrate, 171_962_766,
    optional: true,
    type: Udpa.Annotations.FieldMigrateAnnotation,
    json_name: "fieldMigrate"

  extend Google.Protobuf.EnumOptions, :enum_migrate, 171_962_766,
    optional: true,
    type: Udpa.Annotations.MigrateAnnotation,
    json_name: "enumMigrate"

  extend Google.Protobuf.EnumValueOptions, :enum_value_migrate, 171_962_766,
    optional: true,
    type: Udpa.Annotations.MigrateAnnotation,
    json_name: "enumValueMigrate"

  extend Google.Protobuf.FileOptions, :file_migrate, 171_962_766,
    optional: true,
    type: Udpa.Annotations.FileMigrateAnnotation,
    json_name: "fileMigrate"

  extend Google.Protobuf.FieldOptions, :sensitive, 76_569_463, optional: true, type: :bool
end