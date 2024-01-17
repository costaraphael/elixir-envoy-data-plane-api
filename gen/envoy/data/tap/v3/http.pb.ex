defmodule Envoy.Data.Tap.V3.HttpBufferedTrace.Message do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, repeated: true, type: Envoy.Config.Core.V3.HeaderValue
  field :body, 2, type: Envoy.Data.Tap.V3.Body
  field :trailers, 3, repeated: true, type: Envoy.Config.Core.V3.HeaderValue

  field :headers_received_time, 4,
    type: Google.Protobuf.Timestamp,
    json_name: "headersReceivedTime"
end

defmodule Envoy.Data.Tap.V3.HttpBufferedTrace do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request, 1, type: Envoy.Data.Tap.V3.HttpBufferedTrace.Message
  field :response, 2, type: Envoy.Data.Tap.V3.HttpBufferedTrace.Message

  field :downstream_connection, 3,
    type: Envoy.Data.Tap.V3.Connection,
    json_name: "downstreamConnection"
end

defmodule Envoy.Data.Tap.V3.HttpStreamedTraceSegment do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :message_piece, 0

  field :trace_id, 1, type: :uint64, json_name: "traceId"

  field :request_headers, 2,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "requestHeaders",
    oneof: 0

  field :request_body_chunk, 3,
    type: Envoy.Data.Tap.V3.Body,
    json_name: "requestBodyChunk",
    oneof: 0

  field :request_trailers, 4,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "requestTrailers",
    oneof: 0

  field :response_headers, 5,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "responseHeaders",
    oneof: 0

  field :response_body_chunk, 6,
    type: Envoy.Data.Tap.V3.Body,
    json_name: "responseBodyChunk",
    oneof: 0

  field :response_trailers, 7,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "responseTrailers",
    oneof: 0
end