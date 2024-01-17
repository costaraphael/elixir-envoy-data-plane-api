defmodule Envoy.Config.Trace.V2.OpenCensusConfig.TraceContext do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NONE, 0
  field :TRACE_CONTEXT, 1
  field :GRPC_TRACE_BIN, 2
  field :CLOUD_TRACE_CONTEXT, 3
  field :B3, 4
end

defmodule Envoy.Config.Trace.V2.OpenCensusConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trace_config, 1, type: Opencensus.Proto.Trace.V1.TraceConfig, json_name: "traceConfig"
  field :stdout_exporter_enabled, 2, type: :bool, json_name: "stdoutExporterEnabled"
  field :stackdriver_exporter_enabled, 3, type: :bool, json_name: "stackdriverExporterEnabled"
  field :stackdriver_project_id, 4, type: :string, json_name: "stackdriverProjectId"
  field :stackdriver_address, 10, type: :string, json_name: "stackdriverAddress"

  field :stackdriver_grpc_service, 13,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "stackdriverGrpcService"

  field :zipkin_exporter_enabled, 5, type: :bool, json_name: "zipkinExporterEnabled"
  field :zipkin_url, 6, type: :string, json_name: "zipkinUrl"
  field :ocagent_exporter_enabled, 11, type: :bool, json_name: "ocagentExporterEnabled"
  field :ocagent_address, 12, type: :string, json_name: "ocagentAddress"

  field :ocagent_grpc_service, 14,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "ocagentGrpcService"

  field :incoming_trace_context, 8,
    repeated: true,
    type: Envoy.Config.Trace.V2.OpenCensusConfig.TraceContext,
    json_name: "incomingTraceContext",
    enum: true

  field :outgoing_trace_context, 9,
    repeated: true,
    type: Envoy.Config.Trace.V2.OpenCensusConfig.TraceContext,
    json_name: "outgoingTraceContext",
    enum: true
end