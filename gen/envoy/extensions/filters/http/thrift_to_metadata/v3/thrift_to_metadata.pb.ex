defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Field do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :METHOD_NAME, 0
  field :PROTOCOL, 1
  field :TRANSPORT, 2
  field :HEADER_FLAGS, 3
  field :SEQUENCE_ID, 4
  field :MESSAGE_TYPE, 5
  field :REPLY_TYPE, 6
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.KeyValuePair do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: Google.Protobuf.Value
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.FieldSelector do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :id, 2, type: :int32, deprecated: false
  field :child, 3, type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.FieldSelector
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :field, 1, type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Field, enum: true

  field :field_selector, 2,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.FieldSelector,
    json_name: "fieldSelector",
    deprecated: false

  field :method_name, 3, type: :string, json_name: "methodName", deprecated: false

  field :on_present, 4,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.KeyValuePair,
    json_name: "onPresent"

  field :on_missing, 5,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.KeyValuePair,
    json_name: "onMissing"
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.ThriftToMetadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "requestRules"

  field :response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "responseRules"

  field :transport, 3,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 4,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType,
    enum: true,
    deprecated: false

  field :allow_content_types, 5,
    repeated: true,
    type: :string,
    json_name: "allowContentTypes",
    deprecated: false

  field :allow_empty_content_type, 6, type: :bool, json_name: "allowEmptyContentType"
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.ThriftToMetadataPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "requestRules"

  field :response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "responseRules"
end