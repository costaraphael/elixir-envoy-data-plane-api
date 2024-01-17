defmodule Envoy.Config.Tap.V3.OutputSink.Format do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :JSON_BODY_AS_BYTES, 0
  field :JSON_BODY_AS_STRING, 1
  field :PROTO_BINARY, 2
  field :PROTO_BINARY_LENGTH_DELIMITED, 3
  field :PROTO_TEXT, 4
end

defmodule Envoy.Config.Tap.V3.TapConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :match_config, 1,
    type: Envoy.Config.Tap.V3.MatchPredicate,
    json_name: "matchConfig",
    deprecated: true

  field :match, 4, type: Envoy.Config.Common.Matcher.V3.MatchPredicate

  field :output_config, 2,
    type: Envoy.Config.Tap.V3.OutputConfig,
    json_name: "outputConfig",
    deprecated: false

  field :tap_enabled, 3,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "tapEnabled"
end

defmodule Envoy.Config.Tap.V3.MatchPredicate.MatchSet do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, repeated: true, type: Envoy.Config.Tap.V3.MatchPredicate, deprecated: false
end

defmodule Envoy.Config.Tap.V3.MatchPredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :or_match, 1,
    type: Envoy.Config.Tap.V3.MatchPredicate.MatchSet,
    json_name: "orMatch",
    oneof: 0

  field :and_match, 2,
    type: Envoy.Config.Tap.V3.MatchPredicate.MatchSet,
    json_name: "andMatch",
    oneof: 0

  field :not_match, 3, type: Envoy.Config.Tap.V3.MatchPredicate, json_name: "notMatch", oneof: 0
  field :any_match, 4, type: :bool, json_name: "anyMatch", oneof: 0, deprecated: false

  field :http_request_headers_match, 5,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpRequestHeadersMatch",
    oneof: 0

  field :http_request_trailers_match, 6,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpRequestTrailersMatch",
    oneof: 0

  field :http_response_headers_match, 7,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpResponseHeadersMatch",
    oneof: 0

  field :http_response_trailers_match, 8,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpResponseTrailersMatch",
    oneof: 0

  field :http_request_generic_body_match, 9,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch,
    json_name: "httpRequestGenericBodyMatch",
    oneof: 0

  field :http_response_generic_body_match, 10,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch,
    json_name: "httpResponseGenericBodyMatch",
    oneof: 0
end

defmodule Envoy.Config.Tap.V3.HttpHeadersMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
end

defmodule Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :string_match, 1, type: :string, json_name: "stringMatch", oneof: 0, deprecated: false
  field :binary_match, 2, type: :bytes, json_name: "binaryMatch", oneof: 0, deprecated: false
end

defmodule Envoy.Config.Tap.V3.HttpGenericBodyMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bytes_limit, 1, type: :uint32, json_name: "bytesLimit"

  field :patterns, 2,
    repeated: true,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch,
    deprecated: false
end

defmodule Envoy.Config.Tap.V3.OutputConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :sinks, 1, repeated: true, type: Envoy.Config.Tap.V3.OutputSink, deprecated: false

  field :max_buffered_rx_bytes, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedRxBytes"

  field :max_buffered_tx_bytes, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedTxBytes"

  field :streaming, 4, type: :bool
end

defmodule Envoy.Config.Tap.V3.OutputSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :output_sink_type, 0

  field :format, 1, type: Envoy.Config.Tap.V3.OutputSink.Format, enum: true, deprecated: false

  field :streaming_admin, 2,
    type: Envoy.Config.Tap.V3.StreamingAdminSink,
    json_name: "streamingAdmin",
    oneof: 0

  field :file_per_tap, 3,
    type: Envoy.Config.Tap.V3.FilePerTapSink,
    json_name: "filePerTap",
    oneof: 0

  field :streaming_grpc, 4,
    type: Envoy.Config.Tap.V3.StreamingGrpcSink,
    json_name: "streamingGrpc",
    oneof: 0

  field :buffered_admin, 5,
    type: Envoy.Config.Tap.V3.BufferedAdminSink,
    json_name: "bufferedAdmin",
    oneof: 0

  field :custom_sink, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customSink",
    oneof: 0
end

defmodule Envoy.Config.Tap.V3.StreamingAdminSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Tap.V3.BufferedAdminSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_traces, 1, type: :uint64, json_name: "maxTraces", deprecated: false
  field :timeout, 2, type: Google.Protobuf.Duration
end

defmodule Envoy.Config.Tap.V3.FilePerTapSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :path_prefix, 1, type: :string, json_name: "pathPrefix", deprecated: false
end

defmodule Envoy.Config.Tap.V3.StreamingGrpcSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tap_id, 1, type: :string, json_name: "tapId"

  field :grpc_service, 2,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false
end