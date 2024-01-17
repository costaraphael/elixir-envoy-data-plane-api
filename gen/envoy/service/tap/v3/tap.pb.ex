defmodule Envoy.Service.Tap.V3.StreamTapsRequest.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
  field :tap_id, 2, type: :string, json_name: "tapId"
end

defmodule Envoy.Service.Tap.V3.StreamTapsRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.Tap.V3.StreamTapsRequest.Identifier
  field :trace_id, 2, type: :uint64, json_name: "traceId"
  field :trace, 3, type: Envoy.Data.Tap.V3.TraceWrapper
end

defmodule Envoy.Service.Tap.V3.StreamTapsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Tap.V3.TapSinkService.Service do
  use GRPC.Service,
    name: "envoy.service.tap.v3.TapSinkService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamTaps,
      stream(Envoy.Service.Tap.V3.StreamTapsRequest),
      Envoy.Service.Tap.V3.StreamTapsResponse
end

defmodule Envoy.Service.Tap.V3.TapSinkService.Stub do
  use GRPC.Stub, service: Envoy.Service.Tap.V3.TapSinkService.Service
end