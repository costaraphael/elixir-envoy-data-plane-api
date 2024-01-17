defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.ValueType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :PROTOBUF_VALUE, 0
  field :STRING, 1
  field :NUMBER, 2
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value_type, 0

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: Google.Protobuf.Value, oneof: 0

  field :type, 4,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.ValueType,
    enum: true,
    deprecated: false

  field :preserve_existing_metadata_value, 5,
    type: :bool,
    json_name: "preserveExistingMetadataValue"
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Selector do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :selector, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Rule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :selectors, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Selector,
    deprecated: false

  field :on_present, 2,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair,
    json_name: "onPresent"

  field :on_missing, 3,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair,
    json_name: "onMissing"

  field :on_error, 4,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair,
    json_name: "onError"
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.MatchRules do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Rule,
    deprecated: false

  field :allow_content_types, 2,
    repeated: true,
    type: :string,
    json_name: "allowContentTypes",
    deprecated: false

  field :allow_empty_content_type, 3, type: :bool, json_name: "allowEmptyContentType"
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_rules, 1,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.MatchRules,
    json_name: "requestRules"

  field :response_rules, 2,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.MatchRules,
    json_name: "responseRules"
end