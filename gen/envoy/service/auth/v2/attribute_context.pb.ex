defmodule Envoy.Service.Auth.V2.AttributeContext.Peer.LabelsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V2.AttributeContext.Peer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, type: Envoy.Api.V2.Core.Address
  field :service, 2, type: :string

  field :labels, 3,
    repeated: true,
    type: Envoy.Service.Auth.V2.AttributeContext.Peer.LabelsEntry,
    map: true

  field :principal, 4, type: :string
  field :certificate, 5, type: :string
end

defmodule Envoy.Service.Auth.V2.AttributeContext.Request do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :time, 1, type: Google.Protobuf.Timestamp
  field :http, 2, type: Envoy.Service.Auth.V2.AttributeContext.HttpRequest
end

defmodule Envoy.Service.Auth.V2.AttributeContext.HttpRequest.HeadersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V2.AttributeContext.HttpRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: :string
  field :method, 2, type: :string

  field :headers, 3,
    repeated: true,
    type: Envoy.Service.Auth.V2.AttributeContext.HttpRequest.HeadersEntry,
    map: true

  field :path, 4, type: :string
  field :host, 5, type: :string
  field :scheme, 6, type: :string
  field :query, 7, type: :string
  field :fragment, 8, type: :string
  field :size, 9, type: :int64
  field :protocol, 10, type: :string
  field :body, 11, type: :string
end

defmodule Envoy.Service.Auth.V2.AttributeContext.ContextExtensionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V2.AttributeContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :source, 1, type: Envoy.Service.Auth.V2.AttributeContext.Peer
  field :destination, 2, type: Envoy.Service.Auth.V2.AttributeContext.Peer
  field :request, 4, type: Envoy.Service.Auth.V2.AttributeContext.Request

  field :context_extensions, 10,
    repeated: true,
    type: Envoy.Service.Auth.V2.AttributeContext.ContextExtensionsEntry,
    json_name: "contextExtensions",
    map: true

  field :metadata_context, 11, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataContext"
end