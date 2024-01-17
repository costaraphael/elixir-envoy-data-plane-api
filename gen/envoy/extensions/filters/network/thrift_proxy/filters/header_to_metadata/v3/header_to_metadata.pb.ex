defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.ValueType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :STRING, 0
  field :NUMBER, 1
  field :PROTOBUF_VALUE, 2
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.ValueEncode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NONE, 0
  field :BASE64, 1
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.KeyValuePair do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value_type, 0

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: :string, oneof: 0

  field :regex_value_rewrite, 4,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexValueRewrite",
    oneof: 0

  field :type, 5,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.ValueType,
    enum: true,
    deprecated: false

  field :encode, 6,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.ValueEncode,
    enum: true
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.Rule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header, 1, type: :string, deprecated: false

  field :on_present, 2,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.KeyValuePair,
    json_name: "onPresent"

  field :on_missing, 3,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.KeyValuePair,
    json_name: "onMissing"

  field :remove, 4, type: :bool
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_rules, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.HeaderToMetadata.V3.HeaderToMetadata.Rule,
    json_name: "requestRules",
    deprecated: false
end