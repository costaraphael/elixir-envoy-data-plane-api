defmodule Envoy.Type.Tracing.V3.CustomTag.Literal do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: :string, deprecated: false
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Environment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :default_value, 2, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Header do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :default_value, 2, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Metadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :kind, 1, type: Envoy.Type.Metadata.V3.MetadataKind
  field :metadata_key, 2, type: Envoy.Type.Metadata.V3.MetadataKey, json_name: "metadataKey"
  field :default_value, 3, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Type.Tracing.V3.CustomTag do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :tag, 1, type: :string, deprecated: false
  field :literal, 2, type: Envoy.Type.Tracing.V3.CustomTag.Literal, oneof: 0
  field :environment, 3, type: Envoy.Type.Tracing.V3.CustomTag.Environment, oneof: 0

  field :request_header, 4,
    type: Envoy.Type.Tracing.V3.CustomTag.Header,
    json_name: "requestHeader",
    oneof: 0

  field :metadata, 5, type: Envoy.Type.Tracing.V3.CustomTag.Metadata, oneof: 0
end