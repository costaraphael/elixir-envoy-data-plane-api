defmodule Envoy.Config.Core.V3.HealthStatus do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :HEALTHY, 1
  field :UNHEALTHY, 2
  field :DRAINING, 3
  field :TIMEOUT, 4
  field :DEGRADED, 5
end

defmodule Envoy.Config.Core.V3.HealthStatusSet do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :statuses, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.HealthStatus,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.HealthCheck.Payload do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :payload, 0

  field :text, 1, type: :string, oneof: 0, deprecated: false
  field :binary, 2, type: :bytes, oneof: 0
end

defmodule Envoy.Config.Core.V3.HealthCheck.HttpHealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :host, 1, type: :string, deprecated: false
  field :path, 2, type: :string, deprecated: false
  field :send, 3, type: Envoy.Config.Core.V3.HealthCheck.Payload
  field :receive, 4, repeated: true, type: Envoy.Config.Core.V3.HealthCheck.Payload

  field :response_buffer_size, 14,
    type: Google.Protobuf.UInt64Value,
    json_name: "responseBufferSize",
    deprecated: false

  field :request_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 8,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :expected_statuses, 9,
    repeated: true,
    type: Envoy.Type.V3.Int64Range,
    json_name: "expectedStatuses"

  field :retriable_statuses, 12,
    repeated: true,
    type: Envoy.Type.V3.Int64Range,
    json_name: "retriableStatuses"

  field :codec_client_type, 10,
    type: Envoy.Type.V3.CodecClientType,
    json_name: "codecClientType",
    enum: true,
    deprecated: false

  field :service_name_matcher, 11,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "serviceNameMatcher"

  field :method, 13, type: Envoy.Config.Core.V3.RequestMethod, enum: true, deprecated: false
end

defmodule Envoy.Config.Core.V3.HealthCheck.TcpHealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :send, 1, type: Envoy.Config.Core.V3.HealthCheck.Payload
  field :receive, 2, repeated: true, type: Envoy.Config.Core.V3.HealthCheck.Payload

  field :proxy_protocol_config, 3,
    type: Envoy.Config.Core.V3.ProxyProtocolConfig,
    json_name: "proxyProtocolConfig"
end

defmodule Envoy.Config.Core.V3.HealthCheck.RedisHealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
end

defmodule Envoy.Config.Core.V3.HealthCheck.GrpcHealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :service_name, 1, type: :string, json_name: "serviceName"
  field :authority, 2, type: :string, deprecated: false

  field :initial_metadata, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "initialMetadata",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.HealthCheck.CustomHealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Core.V3.HealthCheck.TlsOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :alpn_protocols, 1, repeated: true, type: :string, json_name: "alpnProtocols"
end

defmodule Envoy.Config.Core.V3.HealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :health_checker, 0

  field :timeout, 1, type: Google.Protobuf.Duration, deprecated: false
  field :interval, 2, type: Google.Protobuf.Duration, deprecated: false
  field :initial_jitter, 20, type: Google.Protobuf.Duration, json_name: "initialJitter"
  field :interval_jitter, 3, type: Google.Protobuf.Duration, json_name: "intervalJitter"
  field :interval_jitter_percent, 18, type: :uint32, json_name: "intervalJitterPercent"

  field :unhealthy_threshold, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "unhealthyThreshold",
    deprecated: false

  field :healthy_threshold, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "healthyThreshold",
    deprecated: false

  field :alt_port, 6, type: Google.Protobuf.UInt32Value, json_name: "altPort"
  field :reuse_connection, 7, type: Google.Protobuf.BoolValue, json_name: "reuseConnection"

  field :http_health_check, 8,
    type: Envoy.Config.Core.V3.HealthCheck.HttpHealthCheck,
    json_name: "httpHealthCheck",
    oneof: 0

  field :tcp_health_check, 9,
    type: Envoy.Config.Core.V3.HealthCheck.TcpHealthCheck,
    json_name: "tcpHealthCheck",
    oneof: 0

  field :grpc_health_check, 11,
    type: Envoy.Config.Core.V3.HealthCheck.GrpcHealthCheck,
    json_name: "grpcHealthCheck",
    oneof: 0

  field :custom_health_check, 13,
    type: Envoy.Config.Core.V3.HealthCheck.CustomHealthCheck,
    json_name: "customHealthCheck",
    oneof: 0

  field :no_traffic_interval, 12,
    type: Google.Protobuf.Duration,
    json_name: "noTrafficInterval",
    deprecated: false

  field :no_traffic_healthy_interval, 24,
    type: Google.Protobuf.Duration,
    json_name: "noTrafficHealthyInterval",
    deprecated: false

  field :unhealthy_interval, 14,
    type: Google.Protobuf.Duration,
    json_name: "unhealthyInterval",
    deprecated: false

  field :unhealthy_edge_interval, 15,
    type: Google.Protobuf.Duration,
    json_name: "unhealthyEdgeInterval",
    deprecated: false

  field :healthy_edge_interval, 16,
    type: Google.Protobuf.Duration,
    json_name: "healthyEdgeInterval",
    deprecated: false

  field :event_log_path, 17, type: :string, json_name: "eventLogPath", deprecated: true

  field :event_logger, 25,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "eventLogger"

  field :event_service, 22,
    type: Envoy.Config.Core.V3.EventServiceConfig,
    json_name: "eventService"

  field :always_log_health_check_failures, 19,
    type: :bool,
    json_name: "alwaysLogHealthCheckFailures"

  field :always_log_health_check_success, 26,
    type: :bool,
    json_name: "alwaysLogHealthCheckSuccess"

  field :tls_options, 21,
    type: Envoy.Config.Core.V3.HealthCheck.TlsOptions,
    json_name: "tlsOptions"

  field :transport_socket_match_criteria, 23,
    type: Google.Protobuf.Struct,
    json_name: "transportSocketMatchCriteria"
end