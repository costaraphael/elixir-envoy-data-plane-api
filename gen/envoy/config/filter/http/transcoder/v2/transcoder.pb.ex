defmodule Envoy.Config.Filter.Http.Transcoder.V2.GrpcJsonTranscoder.PrintOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :add_whitespace, 1, type: :bool, json_name: "addWhitespace"
  field :always_print_primitive_fields, 2, type: :bool, json_name: "alwaysPrintPrimitiveFields"
  field :always_print_enums_as_ints, 3, type: :bool, json_name: "alwaysPrintEnumsAsInts"
  field :preserve_proto_field_names, 4, type: :bool, json_name: "preserveProtoFieldNames"
end

defmodule Envoy.Config.Filter.Http.Transcoder.V2.GrpcJsonTranscoder do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :descriptor_set, 0

  field :proto_descriptor, 1, type: :string, json_name: "protoDescriptor", oneof: 0
  field :proto_descriptor_bin, 4, type: :bytes, json_name: "protoDescriptorBin", oneof: 0
  field :services, 2, repeated: true, type: :string, deprecated: false

  field :print_options, 3,
    type: Envoy.Config.Filter.Http.Transcoder.V2.GrpcJsonTranscoder.PrintOptions,
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
end