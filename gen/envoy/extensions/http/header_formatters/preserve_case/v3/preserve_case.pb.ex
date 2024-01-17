defmodule Envoy.Extensions.Http.HeaderFormatters.PreserveCase.V3.PreserveCaseFormatterConfig.FormatterTypeOnEnvoyHeaders do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :PROPER_CASE, 1
end

defmodule Envoy.Extensions.Http.HeaderFormatters.PreserveCase.V3.PreserveCaseFormatterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :forward_reason_phrase, 1, type: :bool, json_name: "forwardReasonPhrase"

  field :formatter_type_on_envoy_headers, 2,
    type:
      Envoy.Extensions.Http.HeaderFormatters.PreserveCase.V3.PreserveCaseFormatterConfig.FormatterTypeOnEnvoyHeaders,
    json_name: "formatterTypeOnEnvoyHeaders",
    enum: true,
    deprecated: false
end