defmodule Envoy.Service.Auth.V3.AttributeContext.Peer.LabelsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.Peer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, type: Envoy.Config.Core.V3.Address
  field :service, 2, type: :string

  field :labels, 3,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.Peer.LabelsEntry,
    map: true

  field :principal, 4, type: :string
  field :certificate, 5, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.Request do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :time, 1, type: Google.Protobuf.Timestamp
  field :http, 2, type: Envoy.Service.Auth.V3.AttributeContext.HttpRequest
end

defmodule Envoy.Service.Auth.V3.AttributeContext.HttpRequest.HeadersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.HttpRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: :string
  field :method, 2, type: :string

  field :headers, 3,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.HttpRequest.HeadersEntry,
    map: true,
    deprecated: false

  field :header_map, 13,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "headerMap",
    deprecated: false

  field :path, 4, type: :string
  field :host, 5, type: :string
  field :scheme, 6, type: :string
  field :query, 7, type: :string
  field :fragment, 8, type: :string
  field :size, 9, type: :int64
  field :protocol, 10, type: :string
  field :body, 11, type: :string
  field :raw_body, 12, type: :bytes, json_name: "rawBody"
end

defmodule Envoy.Service.Auth.V3.AttributeContext.TLSSession do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :sni, 1, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.ContextExtensionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :source, 1, type: Envoy.Service.Auth.V3.AttributeContext.Peer
  field :destination, 2, type: Envoy.Service.Auth.V3.AttributeContext.Peer
  field :request, 4, type: Envoy.Service.Auth.V3.AttributeContext.Request

  field :context_extensions, 10,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.ContextExtensionsEntry,
    json_name: "contextExtensions",
    map: true

  field :metadata_context, 11, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataContext"

  field :route_metadata_context, 13,
    type: Envoy.Config.Core.V3.Metadata,
    json_name: "routeMetadataContext"

  field :tls_session, 12,
    type: Envoy.Service.Auth.V3.AttributeContext.TLSSession,
    json_name: "tlsSession"
end