defmodule Envoy.Config.Core.V3.JsonFormatOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :sort_properties, 1, type: :bool, json_name: "sortProperties"
end

defmodule Envoy.Config.Core.V3.SubstitutionFormatString do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :format, 0

  field :text_format, 1, type: :string, json_name: "textFormat", oneof: 0, deprecated: true

  field :json_format, 2,
    type: Google.Protobuf.Struct,
    json_name: "jsonFormat",
    oneof: 0,
    deprecated: false

  field :text_format_source, 5,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "textFormatSource",
    oneof: 0

  field :omit_empty_values, 3, type: :bool, json_name: "omitEmptyValues"
  field :content_type, 4, type: :string, json_name: "contentType", deprecated: false
  field :formatters, 6, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig

  field :json_format_options, 7,
    type: Envoy.Config.Core.V3.JsonFormatOptions,
    json_name: "jsonFormatOptions"
end