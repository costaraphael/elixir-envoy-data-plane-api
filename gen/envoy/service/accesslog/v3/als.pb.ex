defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
  field :log_name, 2, type: :string, json_name: "logName", deprecated: false
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.HTTPAccessLogEntries do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :log_entry, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPAccessLogEntry,
    json_name: "logEntry",
    deprecated: false
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.TCPAccessLogEntries do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :log_entry, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.TCPAccessLogEntry,
    json_name: "logEntry",
    deprecated: false
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :log_entries, 0

  field :identifier, 1, type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.Identifier

  field :http_logs, 2,
    type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.HTTPAccessLogEntries,
    json_name: "httpLogs",
    oneof: 0

  field :tcp_logs, 3,
    type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.TCPAccessLogEntries,
    json_name: "tcpLogs",
    oneof: 0
end

defmodule Envoy.Service.Accesslog.V3.AccessLogService.Service do
  use GRPC.Service,
    name: "envoy.service.accesslog.v3.AccessLogService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamAccessLogs,
      stream(Envoy.Service.Accesslog.V3.StreamAccessLogsMessage),
      Envoy.Service.Accesslog.V3.StreamAccessLogsResponse
end

defmodule Envoy.Service.Accesslog.V3.AccessLogService.Stub do
  use GRPC.Stub, service: Envoy.Service.Accesslog.V3.AccessLogService.Service
end