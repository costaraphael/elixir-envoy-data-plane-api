defmodule Envoy.Type.Metadata.V3.MetadataKey.PathSegment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Metadata.V3.MetadataKey do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Metadata.V3.MetadataKey.PathSegment,
    deprecated: false
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Request do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Route do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Cluster do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Host do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.Metadata.V3.MetadataKind do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :kind, 0

  field :request, 1, type: Envoy.Type.Metadata.V3.MetadataKind.Request, oneof: 0
  field :route, 2, type: Envoy.Type.Metadata.V3.MetadataKind.Route, oneof: 0
  field :cluster, 3, type: Envoy.Type.Metadata.V3.MetadataKind.Cluster, oneof: 0
  field :host, 4, type: Envoy.Type.Metadata.V3.MetadataKind.Host, oneof: 0
end