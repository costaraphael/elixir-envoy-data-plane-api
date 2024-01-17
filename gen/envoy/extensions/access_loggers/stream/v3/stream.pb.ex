defmodule Envoy.Extensions.AccessLoggers.Stream.V3.StdoutAccessLog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :access_log_format, 0

  field :log_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stream.V3.StderrAccessLog do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :access_log_format, 0

  field :log_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end