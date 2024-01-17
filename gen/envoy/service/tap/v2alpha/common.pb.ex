defmodule Envoy.Service.Tap.V2alpha.OutputSink.Format do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :JSON_BODY_AS_BYTES, 0
  field :JSON_BODY_AS_STRING, 1
  field :PROTO_BINARY, 2
  field :PROTO_BINARY_LENGTH_DELIMITED, 3
  field :PROTO_TEXT, 4
end

defmodule Envoy.Service.Tap.V2alpha.TapConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :match_config, 1,
    type: Envoy.Service.Tap.V2alpha.MatchPredicate,
    json_name: "matchConfig",
    deprecated: false

  field :output_config, 2,
    type: Envoy.Service.Tap.V2alpha.OutputConfig,
    json_name: "outputConfig",
    deprecated: false

  field :tap_enabled, 3, type: Envoy.Api.V2.Core.RuntimeFractionalPercent, json_name: "tapEnabled"
end

defmodule Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1,
    repeated: true,
    type: Envoy.Service.Tap.V2alpha.MatchPredicate,
    deprecated: false
end

defmodule Envoy.Service.Tap.V2alpha.MatchPredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :or_match, 1,
    type: Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet,
    json_name: "orMatch",
    oneof: 0

  field :and_match, 2,
    type: Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet,
    json_name: "andMatch",
    oneof: 0

  field :not_match, 3,
    type: Envoy.Service.Tap.V2alpha.MatchPredicate,
    json_name: "notMatch",
    oneof: 0

  field :any_match, 4, type: :bool, json_name: "anyMatch", oneof: 0, deprecated: false

  field :http_request_headers_match, 5,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    json_name: "httpRequestHeadersMatch",
    oneof: 0

  field :http_request_trailers_match, 6,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    json_name: "httpRequestTrailersMatch",
    oneof: 0

  field :http_response_headers_match, 7,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    json_name: "httpResponseHeadersMatch",
    oneof: 0

  field :http_response_trailers_match, 8,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    json_name: "httpResponseTrailersMatch",
    oneof: 0
end

defmodule Envoy.Service.Tap.V2alpha.HttpHeadersMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher
end

defmodule Envoy.Service.Tap.V2alpha.OutputConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :sinks, 1, repeated: true, type: Envoy.Service.Tap.V2alpha.OutputSink, deprecated: false

  field :max_buffered_rx_bytes, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedRxBytes"

  field :max_buffered_tx_bytes, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedTxBytes"

  field :streaming, 4, type: :bool
end

defmodule Envoy.Service.Tap.V2alpha.OutputSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :output_sink_type, 0

  field :format, 1,
    type: Envoy.Service.Tap.V2alpha.OutputSink.Format,
    enum: true,
    deprecated: false

  field :streaming_admin, 2,
    type: Envoy.Service.Tap.V2alpha.StreamingAdminSink,
    json_name: "streamingAdmin",
    oneof: 0

  field :file_per_tap, 3,
    type: Envoy.Service.Tap.V2alpha.FilePerTapSink,
    json_name: "filePerTap",
    oneof: 0

  field :streaming_grpc, 4,
    type: Envoy.Service.Tap.V2alpha.StreamingGrpcSink,
    json_name: "streamingGrpc",
    oneof: 0
end

defmodule Envoy.Service.Tap.V2alpha.StreamingAdminSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Tap.V2alpha.FilePerTapSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :path_prefix, 1, type: :string, json_name: "pathPrefix", deprecated: false
end

defmodule Envoy.Service.Tap.V2alpha.StreamingGrpcSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tap_id, 1, type: :string, json_name: "tapId"

  field :grpc_service, 2,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcService",
    deprecated: false
end