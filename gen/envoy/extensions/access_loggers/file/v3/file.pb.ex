defmodule Envoy.Extensions.AccessLoggers.File.V3.FileAccessLog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :access_log_format, 0

  field :path, 1, type: :string, deprecated: false
  field :format, 2, type: :string, oneof: 0, deprecated: true

  field :json_format, 3,
    type: Google.Protobuf.Struct,
    json_name: "jsonFormat",
    oneof: 0,
    deprecated: true

  field :typed_json_format, 4,
    type: Google.Protobuf.Struct,
    json_name: "typedJsonFormat",
    oneof: 0,
    deprecated: true

  field :log_format, 5,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end