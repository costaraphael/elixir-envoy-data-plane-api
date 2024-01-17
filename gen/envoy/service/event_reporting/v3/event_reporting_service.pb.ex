defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier
  field :events, 2, repeated: true, type: Google.Protobuf.Any, deprecated: false
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.EventReporting.V3.EventReportingService.Service do
  use GRPC.Service,
    name: "envoy.service.event_reporting.v3.EventReportingService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamEvents,
      stream(Envoy.Service.EventReporting.V3.StreamEventsRequest),
      stream(Envoy.Service.EventReporting.V3.StreamEventsResponse)
end

defmodule Envoy.Service.EventReporting.V3.EventReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.EventReporting.V3.EventReportingService.Service
end