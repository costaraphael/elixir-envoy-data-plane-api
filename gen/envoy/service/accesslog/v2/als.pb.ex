defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
  field :log_name, 2, type: :string, json_name: "logName", deprecated: false
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.HTTPAccessLogEntries do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :log_entry, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPAccessLogEntry,
    json_name: "logEntry",
    deprecated: false
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.TCPAccessLogEntries do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :log_entry, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.TCPAccessLogEntry,
    json_name: "logEntry",
    deprecated: false
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :log_entries, 0

  field :identifier, 1, type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier

  field :http_logs, 2,
    type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.HTTPAccessLogEntries,
    json_name: "httpLogs",
    oneof: 0

  field :tcp_logs, 3,
    type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.TCPAccessLogEntries,
    json_name: "tcpLogs",
    oneof: 0
end

defmodule Envoy.Service.Accesslog.V2.AccessLogService.Service do
  use GRPC.Service,
    name: "envoy.service.accesslog.v2.AccessLogService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamAccessLogs,
      stream(Envoy.Service.Accesslog.V2.StreamAccessLogsMessage),
      Envoy.Service.Accesslog.V2.StreamAccessLogsResponse
end

defmodule Envoy.Service.Accesslog.V2.AccessLogService.Stub do
  use GRPC.Stub, service: Envoy.Service.Accesslog.V2.AccessLogService.Service
end