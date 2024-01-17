defmodule Envoy.Data.Accesslog.V3.AccessLogType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NotSet, 0
  field :TcpUpstreamConnected, 1
  field :TcpPeriodic, 2
  field :TcpConnectionEnd, 3
  field :DownstreamStart, 4
  field :DownstreamPeriodic, 5
  field :DownstreamEnd, 6
  field :UpstreamPoolReady, 7
  field :UpstreamPeriodic, 8
  field :UpstreamEnd, 9
  field :DownstreamTunnelSuccessfullyEstablished, 10
  field :UdpTunnelUpstreamConnected, 11
  field :UdpPeriodic, 12
  field :UdpSessionEnd, 13
end

defmodule Envoy.Data.Accesslog.V3.HTTPAccessLogEntry.HTTPVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :PROTOCOL_UNSPECIFIED, 0
  field :HTTP10, 1
  field :HTTP11, 2
  field :HTTP2, 3
  field :HTTP3, 4
end

defmodule Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized.Reason do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :REASON_UNSPECIFIED, 0
  field :EXTERNAL_SERVICE, 1
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties.TLSVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :VERSION_UNSPECIFIED, 0
  field :TLSv1, 1
  field :TLSv1_1, 2
  field :TLSv1_2, 3
  field :TLSv1_3, 4
end

defmodule Envoy.Data.Accesslog.V3.TCPAccessLogEntry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_properties, 1,
    type: Envoy.Data.Accesslog.V3.AccessLogCommon,
    json_name: "commonProperties"

  field :connection_properties, 2,
    type: Envoy.Data.Accesslog.V3.ConnectionProperties,
    json_name: "connectionProperties"
end

defmodule Envoy.Data.Accesslog.V3.HTTPAccessLogEntry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_properties, 1,
    type: Envoy.Data.Accesslog.V3.AccessLogCommon,
    json_name: "commonProperties"

  field :protocol_version, 2,
    type: Envoy.Data.Accesslog.V3.HTTPAccessLogEntry.HTTPVersion,
    json_name: "protocolVersion",
    enum: true

  field :request, 3, type: Envoy.Data.Accesslog.V3.HTTPRequestProperties
  field :response, 4, type: Envoy.Data.Accesslog.V3.HTTPResponseProperties
end

defmodule Envoy.Data.Accesslog.V3.ConnectionProperties do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :received_bytes, 1, type: :uint64, json_name: "receivedBytes"
  field :sent_bytes, 2, type: :uint64, json_name: "sentBytes"
end

defmodule Envoy.Data.Accesslog.V3.AccessLogCommon.FilterStateObjectsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Data.Accesslog.V3.AccessLogCommon.CustomTagsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V3.AccessLogCommon do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :sample_rate, 1, type: :double, json_name: "sampleRate", deprecated: false

  field :downstream_remote_address, 2,
    type: Envoy.Config.Core.V3.Address,
    json_name: "downstreamRemoteAddress"

  field :downstream_local_address, 3,
    type: Envoy.Config.Core.V3.Address,
    json_name: "downstreamLocalAddress"

  field :tls_properties, 4,
    type: Envoy.Data.Accesslog.V3.TLSProperties,
    json_name: "tlsProperties"

  field :start_time, 5, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :time_to_last_rx_byte, 6, type: Google.Protobuf.Duration, json_name: "timeToLastRxByte"

  field :time_to_first_upstream_tx_byte, 7,
    type: Google.Protobuf.Duration,
    json_name: "timeToFirstUpstreamTxByte"

  field :time_to_last_upstream_tx_byte, 8,
    type: Google.Protobuf.Duration,
    json_name: "timeToLastUpstreamTxByte"

  field :time_to_first_upstream_rx_byte, 9,
    type: Google.Protobuf.Duration,
    json_name: "timeToFirstUpstreamRxByte"

  field :time_to_last_upstream_rx_byte, 10,
    type: Google.Protobuf.Duration,
    json_name: "timeToLastUpstreamRxByte"

  field :time_to_first_downstream_tx_byte, 11,
    type: Google.Protobuf.Duration,
    json_name: "timeToFirstDownstreamTxByte"

  field :time_to_last_downstream_tx_byte, 12,
    type: Google.Protobuf.Duration,
    json_name: "timeToLastDownstreamTxByte"

  field :upstream_remote_address, 13,
    type: Envoy.Config.Core.V3.Address,
    json_name: "upstreamRemoteAddress"

  field :upstream_local_address, 14,
    type: Envoy.Config.Core.V3.Address,
    json_name: "upstreamLocalAddress"

  field :upstream_cluster, 15, type: :string, json_name: "upstreamCluster"

  field :response_flags, 16,
    type: Envoy.Data.Accesslog.V3.ResponseFlags,
    json_name: "responseFlags"

  field :metadata, 17, type: Envoy.Config.Core.V3.Metadata

  field :upstream_transport_failure_reason, 18,
    type: :string,
    json_name: "upstreamTransportFailureReason"

  field :route_name, 19, type: :string, json_name: "routeName"

  field :downstream_direct_remote_address, 20,
    type: Envoy.Config.Core.V3.Address,
    json_name: "downstreamDirectRemoteAddress"

  field :filter_state_objects, 21,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.AccessLogCommon.FilterStateObjectsEntry,
    json_name: "filterStateObjects",
    map: true

  field :custom_tags, 22,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.AccessLogCommon.CustomTagsEntry,
    json_name: "customTags",
    map: true

  field :duration, 23, type: Google.Protobuf.Duration

  field :upstream_request_attempt_count, 24,
    type: :uint32,
    json_name: "upstreamRequestAttemptCount"

  field :connection_termination_details, 25,
    type: :string,
    json_name: "connectionTerminationDetails"

  field :stream_id, 26, type: :string, json_name: "streamId"

  field :intermediate_log_entry, 27,
    type: :bool,
    json_name: "intermediateLogEntry",
    deprecated: true

  field :downstream_transport_failure_reason, 28,
    type: :string,
    json_name: "downstreamTransportFailureReason"

  field :downstream_wire_bytes_sent, 29, type: :uint64, json_name: "downstreamWireBytesSent"

  field :downstream_wire_bytes_received, 30,
    type: :uint64,
    json_name: "downstreamWireBytesReceived"

  field :upstream_wire_bytes_sent, 31, type: :uint64, json_name: "upstreamWireBytesSent"
  field :upstream_wire_bytes_received, 32, type: :uint64, json_name: "upstreamWireBytesReceived"

  field :access_log_type, 33,
    type: Envoy.Data.Accesslog.V3.AccessLogType,
    json_name: "accessLogType",
    enum: true
end

defmodule Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reason, 1, type: Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized.Reason, enum: true
end

defmodule Envoy.Data.Accesslog.V3.ResponseFlags do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failed_local_healthcheck, 1, type: :bool, json_name: "failedLocalHealthcheck"
  field :no_healthy_upstream, 2, type: :bool, json_name: "noHealthyUpstream"
  field :upstream_request_timeout, 3, type: :bool, json_name: "upstreamRequestTimeout"
  field :local_reset, 4, type: :bool, json_name: "localReset"
  field :upstream_remote_reset, 5, type: :bool, json_name: "upstreamRemoteReset"
  field :upstream_connection_failure, 6, type: :bool, json_name: "upstreamConnectionFailure"

  field :upstream_connection_termination, 7,
    type: :bool,
    json_name: "upstreamConnectionTermination"

  field :upstream_overflow, 8, type: :bool, json_name: "upstreamOverflow"
  field :no_route_found, 9, type: :bool, json_name: "noRouteFound"
  field :delay_injected, 10, type: :bool, json_name: "delayInjected"
  field :fault_injected, 11, type: :bool, json_name: "faultInjected"
  field :rate_limited, 12, type: :bool, json_name: "rateLimited"

  field :unauthorized_details, 13,
    type: Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized,
    json_name: "unauthorizedDetails"

  field :rate_limit_service_error, 14, type: :bool, json_name: "rateLimitServiceError"

  field :downstream_connection_termination, 15,
    type: :bool,
    json_name: "downstreamConnectionTermination"

  field :upstream_retry_limit_exceeded, 16, type: :bool, json_name: "upstreamRetryLimitExceeded"
  field :stream_idle_timeout, 17, type: :bool, json_name: "streamIdleTimeout"
  field :invalid_envoy_request_headers, 18, type: :bool, json_name: "invalidEnvoyRequestHeaders"
  field :downstream_protocol_error, 19, type: :bool, json_name: "downstreamProtocolError"

  field :upstream_max_stream_duration_reached, 20,
    type: :bool,
    json_name: "upstreamMaxStreamDurationReached"

  field :response_from_cache_filter, 21, type: :bool, json_name: "responseFromCacheFilter"
  field :no_filter_config_found, 22, type: :bool, json_name: "noFilterConfigFound"
  field :duration_timeout, 23, type: :bool, json_name: "durationTimeout"
  field :upstream_protocol_error, 24, type: :bool, json_name: "upstreamProtocolError"
  field :no_cluster_found, 25, type: :bool, json_name: "noClusterFound"
  field :overload_manager, 26, type: :bool, json_name: "overloadManager"
  field :dns_resolution_failure, 27, type: :bool, json_name: "dnsResolutionFailure"
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties.SubjectAltName do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :san, 0

  field :uri, 1, type: :string, oneof: 0
  field :dns, 2, type: :string, oneof: 0
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :subject_alt_name, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties.SubjectAltName,
    json_name: "subjectAltName"

  field :subject, 2, type: :string
  field :issuer, 3, type: :string
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tls_version, 1,
    type: Envoy.Data.Accesslog.V3.TLSProperties.TLSVersion,
    json_name: "tlsVersion",
    enum: true

  field :tls_cipher_suite, 2, type: Google.Protobuf.UInt32Value, json_name: "tlsCipherSuite"
  field :tls_sni_hostname, 3, type: :string, json_name: "tlsSniHostname"

  field :local_certificate_properties, 4,
    type: Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties,
    json_name: "localCertificateProperties"

  field :peer_certificate_properties, 5,
    type: Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties,
    json_name: "peerCertificateProperties"

  field :tls_session_id, 6, type: :string, json_name: "tlsSessionId"
  field :ja3_fingerprint, 7, type: :string, json_name: "ja3Fingerprint"
end

defmodule Envoy.Data.Accesslog.V3.HTTPRequestProperties.RequestHeadersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V3.HTTPRequestProperties do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_method, 1,
    type: Envoy.Config.Core.V3.RequestMethod,
    json_name: "requestMethod",
    enum: true,
    deprecated: false

  field :scheme, 2, type: :string
  field :authority, 3, type: :string
  field :port, 4, type: Google.Protobuf.UInt32Value
  field :path, 5, type: :string
  field :user_agent, 6, type: :string, json_name: "userAgent"
  field :referer, 7, type: :string
  field :forwarded_for, 8, type: :string, json_name: "forwardedFor"
  field :request_id, 9, type: :string, json_name: "requestId"
  field :original_path, 10, type: :string, json_name: "originalPath"
  field :request_headers_bytes, 11, type: :uint64, json_name: "requestHeadersBytes"
  field :request_body_bytes, 12, type: :uint64, json_name: "requestBodyBytes"

  field :request_headers, 13,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPRequestProperties.RequestHeadersEntry,
    json_name: "requestHeaders",
    map: true

  field :upstream_header_bytes_sent, 14, type: :uint64, json_name: "upstreamHeaderBytesSent"

  field :downstream_header_bytes_received, 15,
    type: :uint64,
    json_name: "downstreamHeaderBytesReceived"
end

defmodule Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseHeadersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseTrailersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V3.HTTPResponseProperties do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :response_code, 1, type: Google.Protobuf.UInt32Value, json_name: "responseCode"
  field :response_headers_bytes, 2, type: :uint64, json_name: "responseHeadersBytes"
  field :response_body_bytes, 3, type: :uint64, json_name: "responseBodyBytes"

  field :response_headers, 4,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseHeadersEntry,
    json_name: "responseHeaders",
    map: true

  field :response_trailers, 5,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseTrailersEntry,
    json_name: "responseTrailers",
    map: true

  field :response_code_details, 6, type: :string, json_name: "responseCodeDetails"

  field :upstream_header_bytes_received, 7,
    type: :uint64,
    json_name: "upstreamHeaderBytesReceived"

  field :downstream_header_bytes_sent, 8, type: :uint64, json_name: "downstreamHeaderBytesSent"
end