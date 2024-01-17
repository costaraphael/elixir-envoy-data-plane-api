defmodule Envoy.Config.Core.V3.HttpProtocolOptions.HeadersWithUnderscoresAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALLOW, 0
  field :REJECT_REQUEST, 1
  field :DROP_HEADER, 2
end

defmodule Envoy.Config.Core.V3.TcpProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Core.V3.QuicKeepAliveSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false

  field :initial_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "initialInterval",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.QuicProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_concurrent_streams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrentStreams",
    deprecated: false

  field :initial_stream_window_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialStreamWindowSize",
    deprecated: false

  field :initial_connection_window_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialConnectionWindowSize",
    deprecated: false

  field :num_timeouts_to_trigger_port_migration, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "numTimeoutsToTriggerPortMigration",
    deprecated: false

  field :connection_keepalive, 5,
    type: Envoy.Config.Core.V3.QuicKeepAliveSettings,
    json_name: "connectionKeepalive"

  field :connection_options, 6, type: :string, json_name: "connectionOptions"
  field :client_connection_options, 7, type: :string, json_name: "clientConnectionOptions"
end

defmodule Envoy.Config.Core.V3.UpstreamHttpProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :auto_sni, 1, type: :bool, json_name: "autoSni"
  field :auto_san_validation, 2, type: :bool, json_name: "autoSanValidation"

  field :override_auto_sni_header, 3,
    type: :string,
    json_name: "overrideAutoSniHeader",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.AlternateProtocolsCacheOptions.AlternateProtocolsCacheEntry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :hostname, 1, type: :string, deprecated: false
  field :port, 2, type: :uint32, deprecated: false
end

defmodule Envoy.Config.Core.V3.AlternateProtocolsCacheOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :max_entries, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxEntries",
    deprecated: false

  field :key_value_store_config, 3,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "keyValueStoreConfig"

  field :prepopulated_entries, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.AlternateProtocolsCacheOptions.AlternateProtocolsCacheEntry,
    json_name: "prepopulatedEntries"

  field :canonical_suffixes, 5, repeated: true, type: :string, json_name: "canonicalSuffixes"
end

defmodule Envoy.Config.Core.V3.HttpProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :idle_timeout, 1, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :max_connection_duration, 3,
    type: Google.Protobuf.Duration,
    json_name: "maxConnectionDuration"

  field :max_headers_count, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxHeadersCount",
    deprecated: false

  field :max_stream_duration, 4, type: Google.Protobuf.Duration, json_name: "maxStreamDuration"

  field :headers_with_underscores_action, 5,
    type: Envoy.Config.Core.V3.HttpProtocolOptions.HeadersWithUnderscoresAction,
    json_name: "headersWithUnderscoresAction",
    enum: true

  field :max_requests_per_connection, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestsPerConnection"
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :header_format, 0

  field :proper_case_words, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords,
    json_name: "properCaseWords",
    oneof: 0

  field :stateful_formatter, 8,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "statefulFormatter",
    oneof: 0
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allow_absolute_url, 1, type: Google.Protobuf.BoolValue, json_name: "allowAbsoluteUrl"
  field :accept_http_10, 2, type: :bool, json_name: "acceptHttp10"
  field :default_host_for_http_10, 3, type: :string, json_name: "defaultHostForHttp10"

  field :header_key_format, 4,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat,
    json_name: "headerKeyFormat"

  field :enable_trailers, 5, type: :bool, json_name: "enableTrailers"
  field :allow_chunked_length, 6, type: :bool, json_name: "allowChunkedLength"

  field :override_stream_error_on_invalid_http_message, 7,
    type: Google.Protobuf.BoolValue,
    json_name: "overrideStreamErrorOnInvalidHttpMessage"

  field :send_fully_qualified_url, 8, type: :bool, json_name: "sendFullyQualifiedUrl"

  field :use_balsa_parser, 9,
    type: Google.Protobuf.BoolValue,
    json_name: "useBalsaParser",
    deprecated: false

  field :allow_custom_methods, 10, type: :bool, json_name: "allowCustomMethods", deprecated: false
end

defmodule Envoy.Config.Core.V3.KeepaliveSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :interval, 1, type: Google.Protobuf.Duration, deprecated: false
  field :timeout, 2, type: Google.Protobuf.Duration, deprecated: false
  field :interval_jitter, 3, type: Envoy.Type.V3.Percent, json_name: "intervalJitter"

  field :connection_idle_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "connectionIdleInterval",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.Http2ProtocolOptions.SettingsParameter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Google.Protobuf.UInt32Value, deprecated: false
  field :value, 2, type: Google.Protobuf.UInt32Value, deprecated: false
end

defmodule Envoy.Config.Core.V3.Http2ProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :hpack_table_size, 1, type: Google.Protobuf.UInt32Value, json_name: "hpackTableSize"

  field :max_concurrent_streams, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrentStreams",
    deprecated: false

  field :initial_stream_window_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialStreamWindowSize",
    deprecated: false

  field :initial_connection_window_size, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialConnectionWindowSize",
    deprecated: false

  field :allow_connect, 5, type: :bool, json_name: "allowConnect"
  field :allow_metadata, 6, type: :bool, json_name: "allowMetadata"

  field :max_outbound_frames, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxOutboundFrames",
    deprecated: false

  field :max_outbound_control_frames, 8,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxOutboundControlFrames",
    deprecated: false

  field :max_consecutive_inbound_frames_with_empty_payload, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConsecutiveInboundFramesWithEmptyPayload"

  field :max_inbound_priority_frames_per_stream, 10,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInboundPriorityFramesPerStream"

  field :max_inbound_window_update_frames_per_data_frame_sent, 11,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInboundWindowUpdateFramesPerDataFrameSent",
    deprecated: false

  field :stream_error_on_invalid_http_messaging, 12,
    type: :bool,
    json_name: "streamErrorOnInvalidHttpMessaging",
    deprecated: true

  field :override_stream_error_on_invalid_http_message, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "overrideStreamErrorOnInvalidHttpMessage"

  field :custom_settings_parameters, 13,
    repeated: true,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions.SettingsParameter,
    json_name: "customSettingsParameters"

  field :connection_keepalive, 15,
    type: Envoy.Config.Core.V3.KeepaliveSettings,
    json_name: "connectionKeepalive"

  field :use_oghttp2_codec, 16,
    type: Google.Protobuf.BoolValue,
    json_name: "useOghttp2Codec",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.GrpcProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http2_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"
end

defmodule Envoy.Config.Core.V3.Http3ProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :quic_protocol_options, 1,
    type: Envoy.Config.Core.V3.QuicProtocolOptions,
    json_name: "quicProtocolOptions"

  field :override_stream_error_on_invalid_http_message, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "overrideStreamErrorOnInvalidHttpMessage"

  field :allow_extended_connect, 5,
    type: :bool,
    json_name: "allowExtendedConnect",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.SchemeHeaderTransformation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :transformation, 0

  field :scheme_to_overwrite, 1,
    type: :string,
    json_name: "schemeToOverwrite",
    oneof: 0,
    deprecated: false
end