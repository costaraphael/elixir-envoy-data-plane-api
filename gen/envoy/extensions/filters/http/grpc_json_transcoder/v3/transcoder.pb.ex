defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.UrlUnescapeSpec do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALL_CHARACTERS_EXCEPT_RESERVED, 0
  field :ALL_CHARACTERS_EXCEPT_SLASH, 1
  field :ALL_CHARACTERS, 2
end

defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.PrintOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :add_whitespace, 1, type: :bool, json_name: "addWhitespace"
  field :always_print_primitive_fields, 2, type: :bool, json_name: "alwaysPrintPrimitiveFields"
  field :always_print_enums_as_ints, 3, type: :bool, json_name: "alwaysPrintEnumsAsInts"
  field :preserve_proto_field_names, 4, type: :bool, json_name: "preserveProtoFieldNames"
  field :stream_newline_delimited, 5, type: :bool, json_name: "streamNewlineDelimited"
end

defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.RequestValidationOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reject_unknown_method, 1, type: :bool, json_name: "rejectUnknownMethod"

  field :reject_unknown_query_parameters, 2,
    type: :bool,
    json_name: "rejectUnknownQueryParameters"

  field :reject_binding_body_field_collisions, 3,
    type: :bool,
    json_name: "rejectBindingBodyFieldCollisions"
end

defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :descriptor_set, 0

  field :proto_descriptor, 1, type: :string, json_name: "protoDescriptor", oneof: 0
  field :proto_descriptor_bin, 4, type: :bytes, json_name: "protoDescriptorBin", oneof: 0
  field :services, 2, repeated: true, type: :string

  field :print_options, 3,
    type: Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.PrintOptions,
    json_name: "printOptions"

  field :match_incoming_request_route, 5, type: :bool, json_name: "matchIncomingRequestRoute"

  field :ignored_query_parameters, 6,
    repeated: true,
    type: :string,
    json_name: "ignoredQueryParameters"

  field :auto_mapping, 7, type: :bool, json_name: "autoMapping"

  field :ignore_unknown_query_parameters, 8,
    type: :bool,
    json_name: "ignoreUnknownQueryParameters"

  field :convert_grpc_status, 9, type: :bool, json_name: "convertGrpcStatus"

  field :url_unescape_spec, 10,
    type: Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.UrlUnescapeSpec,
    json_name: "urlUnescapeSpec",
    enum: true,
    deprecated: false

  field :query_param_unescape_plus, 12, type: :bool, json_name: "queryParamUnescapePlus"
  field :match_unregistered_custom_verb, 13, type: :bool, json_name: "matchUnregisteredCustomVerb"

  field :request_validation_options, 11,
    type:
      Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.RequestValidationOptions,
    json_name: "requestValidationOptions"

  field :case_insensitive_enum_parsing, 14, type: :bool, json_name: "caseInsensitiveEnumParsing"

  field :max_request_body_size, 15,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBodySize",
    deprecated: false

  field :max_response_body_size, 16,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxResponseBodySize",
    deprecated: false
end