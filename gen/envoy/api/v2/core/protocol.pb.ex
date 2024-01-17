defmodule Envoy.Api.V2.Core.HttpProtocolOptions.HeadersWithUnderscoresAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALLOW, 0
  field :REJECT_REQUEST, 1
  field :DROP_HEADER, 2
end

defmodule Envoy.Api.V2.Core.TcpProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.Core.UpstreamHttpProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :auto_sni, 1, type: :bool, json_name: "autoSni"
  field :auto_san_validation, 2, type: :bool, json_name: "autoSanValidation"
end

defmodule Envoy.Api.V2.Core.HttpProtocolOptions do
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
    type: Envoy.Api.V2.Core.HttpProtocolOptions.HeadersWithUnderscoresAction,
    json_name: "headersWithUnderscoresAction",
    enum: true
end

defmodule Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :header_format, 0

  field :proper_case_words, 1,
    type: Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords,
    json_name: "properCaseWords",
    oneof: 0
end

defmodule Envoy.Api.V2.Core.Http1ProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allow_absolute_url, 1, type: Google.Protobuf.BoolValue, json_name: "allowAbsoluteUrl"
  field :accept_http_10, 2, type: :bool, json_name: "acceptHttp10"
  field :default_host_for_http_10, 3, type: :string, json_name: "defaultHostForHttp10"

  field :header_key_format, 4,
    type: Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat,
    json_name: "headerKeyFormat"

  field :enable_trailers, 5, type: :bool, json_name: "enableTrailers"
end

defmodule Envoy.Api.V2.Core.Http2ProtocolOptions.SettingsParameter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Google.Protobuf.UInt32Value, deprecated: false
  field :value, 2, type: Google.Protobuf.UInt32Value, deprecated: false
end

defmodule Envoy.Api.V2.Core.Http2ProtocolOptions do
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
    json_name: "streamErrorOnInvalidHttpMessaging"

  field :custom_settings_parameters, 13,
    repeated: true,
    type: Envoy.Api.V2.Core.Http2ProtocolOptions.SettingsParameter,
    json_name: "customSettingsParameters"
end

defmodule Envoy.Api.V2.Core.GrpcProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http2_protocol_options, 1,
    type: Envoy.Api.V2.Core.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"
end