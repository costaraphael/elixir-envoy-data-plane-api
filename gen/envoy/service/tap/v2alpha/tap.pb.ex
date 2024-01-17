defmodule Envoy.Service.Tap.V2alpha.StreamTapsRequest.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
  field :tap_id, 2, type: :string, json_name: "tapId"
end

defmodule Envoy.Service.Tap.V2alpha.StreamTapsRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.Tap.V2alpha.StreamTapsRequest.Identifier
  field :trace_id, 2, type: :uint64, json_name: "traceId"
  field :trace, 3, type: Envoy.Data.Tap.V2alpha.TraceWrapper
end

defmodule Envoy.Service.Tap.V2alpha.StreamTapsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Tap.V2alpha.TapSinkService.Service do
  use GRPC.Service,
    name: "envoy.service.tap.v2alpha.TapSinkService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamTaps,
      stream(Envoy.Service.Tap.V2alpha.StreamTapsRequest),
      Envoy.Service.Tap.V2alpha.StreamTapsResponse
end

defmodule Envoy.Service.Tap.V2alpha.TapSinkService.Stub do
  use GRPC.Stub, service: Envoy.Service.Tap.V2alpha.TapSinkService.Service
end