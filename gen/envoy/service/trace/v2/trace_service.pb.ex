defmodule Envoy.Service.Trace.V2.StreamTracesResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Trace.V2.StreamTracesMessage.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
end

defmodule Envoy.Service.Trace.V2.StreamTracesMessage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.Trace.V2.StreamTracesMessage.Identifier
  field :spans, 2, repeated: true, type: Opencensus.Proto.Trace.V1.Span
end

defmodule Envoy.Service.Trace.V2.TraceService.Service do
  use GRPC.Service,
    name: "envoy.service.trace.v2.TraceService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamTraces,
      stream(Envoy.Service.Trace.V2.StreamTracesMessage),
      Envoy.Service.Trace.V2.StreamTracesResponse
end

defmodule Envoy.Service.Trace.V2.TraceService.Stub do
  use GRPC.Stub, service: Envoy.Service.Trace.V2.TraceService.Service
end