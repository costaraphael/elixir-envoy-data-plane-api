defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.ProtoMessageLoggingConfig.LogMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :LogMode_UNSPECIFIED, 0
  field :FIRST_AND_LAST, 1
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.LogDirective do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :LogDirective_UNSPECIFIED, 0
  field :LOG, 1
  field :LOG_REDACT, 2
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.ProtoMessageLoggingConfig.LoggingByMethodEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.ProtoMessageLoggingConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :descriptor_set, 0

  field :data_source, 1, type: Envoy.Config.Core.V3.DataSource, json_name: "dataSource", oneof: 0

  field :proto_descriptor_typed_metadata, 2,
    type: :string,
    json_name: "protoDescriptorTypedMetadata",
    oneof: 0

  field :mode, 3,
    type: Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.ProtoMessageLoggingConfig.LogMode,
    enum: true

  field :logging_by_method, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.ProtoMessageLoggingConfig.LoggingByMethodEntry,
    json_name: "loggingByMethod",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.RequestLoggingByFieldEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string

  field :value, 2,
    type: Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.LogDirective,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.ResponseLoggingByFieldEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string

  field :value, 2,
    type: Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.LogDirective,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_logging_by_field, 2,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.RequestLoggingByFieldEntry,
    json_name: "requestLoggingByField",
    map: true

  field :response_logging_by_field, 3,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageLogging.V3.MethodLogging.ResponseLoggingByFieldEntry,
    json_name: "responseLoggingByField",
    map: true
end