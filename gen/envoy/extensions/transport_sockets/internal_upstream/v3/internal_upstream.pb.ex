defmodule Envoy.Extensions.TransportSockets.InternalUpstream.V3.InternalUpstreamTransport.MetadataValueSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :kind, 1, type: Envoy.Type.Metadata.V3.MetadataKind, deprecated: false
  field :name, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.InternalUpstream.V3.InternalUpstreamTransport do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :passthrough_metadata, 1,
    repeated: true,
    type:
      Envoy.Extensions.TransportSockets.InternalUpstream.V3.InternalUpstreamTransport.MetadataValueSource,
    json_name: "passthroughMetadata"

  field :transport_socket, 3,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false
end