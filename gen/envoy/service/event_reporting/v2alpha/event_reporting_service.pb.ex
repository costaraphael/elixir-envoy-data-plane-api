defmodule Envoy.Service.EventReporting.V2alpha.StreamEventsRequest.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
end

defmodule Envoy.Service.EventReporting.V2alpha.StreamEventsRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.EventReporting.V2alpha.StreamEventsRequest.Identifier
  field :events, 2, repeated: true, type: Google.Protobuf.Any, deprecated: false
end

defmodule Envoy.Service.EventReporting.V2alpha.StreamEventsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.EventReporting.V2alpha.EventReportingService.Service do
  use GRPC.Service,
    name: "envoy.service.event_reporting.v2alpha.EventReportingService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamEvents,
      stream(Envoy.Service.EventReporting.V2alpha.StreamEventsRequest),
      stream(Envoy.Service.EventReporting.V2alpha.StreamEventsResponse)
end

defmodule Envoy.Service.EventReporting.V2alpha.EventReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.EventReporting.V2alpha.EventReportingService.Service
end