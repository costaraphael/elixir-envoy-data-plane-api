defmodule Envoy.Service.Trace.V3.StreamTracesResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Trace.V3.StreamTracesMessage.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
end

defmodule Envoy.Service.Trace.V3.StreamTracesMessage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.Trace.V3.StreamTracesMessage.Identifier
  field :spans, 2, repeated: true, type: Opencensus.Proto.Trace.V1.Span
end

defmodule Envoy.Service.Trace.V3.TraceService.Service do
  use GRPC.Service,
    name: "envoy.service.trace.v3.TraceService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamTraces,
      stream(Envoy.Service.Trace.V3.StreamTracesMessage),
      Envoy.Service.Trace.V3.StreamTracesResponse
end

defmodule Envoy.Service.Trace.V3.TraceService.Stub do
  use GRPC.Stub, service: Envoy.Service.Trace.V3.TraceService.Service
end