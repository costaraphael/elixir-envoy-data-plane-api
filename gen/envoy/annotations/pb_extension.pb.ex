defmodule Envoy.Annotations.PbExtension do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.12.0"

  extend Google.Protobuf.FieldOptions, :disallowed_by_default, 189_503_207,
    optional: true,
    type: :bool,
    json_name: "disallowedByDefault"

  extend Google.Protobuf.FieldOptions, :deprecated_at_minor_version, 157_299_826,
    optional: true,
    type: :string,
    json_name: "deprecatedAtMinorVersion"

  extend Google.Protobuf.EnumValueOptions, :disallowed_by_default_enum, 70_100_853,
    optional: true,
    type: :bool,
    json_name: "disallowedByDefaultEnum"

  extend Google.Protobuf.EnumValueOptions, :deprecated_at_minor_version_enum, 181_198_657,
    optional: true,
    type: :string,
    json_name: "deprecatedAtMinorVersionEnum"

  extend Google.Protobuf.ServiceOptions, :resource, 265_073_217,
    optional: true,
    type: Envoy.Annotations.ResourceAnnotation
end