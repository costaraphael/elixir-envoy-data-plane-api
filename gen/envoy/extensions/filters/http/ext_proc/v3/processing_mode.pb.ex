defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :SEND, 1
  field :SKIP, 2
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NONE, 0
  field :STREAMED, 1
  field :BUFFERED, 2
  field :BUFFERED_PARTIAL, 3
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_header_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "requestHeaderMode",
    enum: true,
    deprecated: false

  field :response_header_mode, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "responseHeaderMode",
    enum: true,
    deprecated: false

  field :request_body_mode, 3,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode,
    json_name: "requestBodyMode",
    enum: true,
    deprecated: false

  field :response_body_mode, 4,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode,
    json_name: "responseBodyMode",
    enum: true,
    deprecated: false

  field :request_trailer_mode, 5,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "requestTrailerMode",
    enum: true,
    deprecated: false

  field :response_trailer_mode, 6,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "responseTrailerMode",
    enum: true,
    deprecated: false
end