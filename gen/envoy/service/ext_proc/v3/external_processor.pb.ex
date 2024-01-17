defmodule Envoy.Service.ExtProc.V3.CommonResponse.ResponseStatus do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :CONTINUE, 0
  field :CONTINUE_AND_REPLACE, 1
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :request, 0

  field :async_mode, 1, type: :bool, json_name: "asyncMode"

  field :request_headers, 2,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :response_headers, 3,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "responseHeaders",
    oneof: 0

  field :request_body, 4,
    type: Envoy.Service.ExtProc.V3.HttpBody,
    json_name: "requestBody",
    oneof: 0

  field :response_body, 5,
    type: Envoy.Service.ExtProc.V3.HttpBody,
    json_name: "responseBody",
    oneof: 0

  field :request_trailers, 6,
    type: Envoy.Service.ExtProc.V3.HttpTrailers,
    json_name: "requestTrailers",
    oneof: 0

  field :response_trailers, 7,
    type: Envoy.Service.ExtProc.V3.HttpTrailers,
    json_name: "responseTrailers",
    oneof: 0
end

defmodule Envoy.Service.ExtProc.V3.ProcessingResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :response, 0

  field :request_headers, 1,
    type: Envoy.Service.ExtProc.V3.HeadersResponse,
    json_name: "requestHeaders",
    oneof: 0

  field :response_headers, 2,
    type: Envoy.Service.ExtProc.V3.HeadersResponse,
    json_name: "responseHeaders",
    oneof: 0

  field :request_body, 3,
    type: Envoy.Service.ExtProc.V3.BodyResponse,
    json_name: "requestBody",
    oneof: 0

  field :response_body, 4,
    type: Envoy.Service.ExtProc.V3.BodyResponse,
    json_name: "responseBody",
    oneof: 0

  field :request_trailers, 5,
    type: Envoy.Service.ExtProc.V3.TrailersResponse,
    json_name: "requestTrailers",
    oneof: 0

  field :response_trailers, 6,
    type: Envoy.Service.ExtProc.V3.TrailersResponse,
    json_name: "responseTrailers",
    oneof: 0

  field :immediate_response, 7,
    type: Envoy.Service.ExtProc.V3.ImmediateResponse,
    json_name: "immediateResponse",
    oneof: 0

  field :dynamic_metadata, 8, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"

  field :mode_override, 9,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "modeOverride"

  field :override_message_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "overrideMessageTimeout"
end

defmodule Envoy.Service.ExtProc.V3.HttpHeaders.AttributesEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.ExtProc.V3.HttpHeaders do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, type: Envoy.Config.Core.V3.HeaderMap

  field :attributes, 2,
    repeated: true,
    type: Envoy.Service.ExtProc.V3.HttpHeaders.AttributesEntry,
    map: true

  field :end_of_stream, 3, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.ExtProc.V3.HttpBody do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :body, 1, type: :bytes
  field :end_of_stream, 2, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.ExtProc.V3.HttpTrailers do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trailers, 1, type: Envoy.Config.Core.V3.HeaderMap
end

defmodule Envoy.Service.ExtProc.V3.HeadersResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :response, 1, type: Envoy.Service.ExtProc.V3.CommonResponse
end

defmodule Envoy.Service.ExtProc.V3.TrailersResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_mutation, 1,
    type: Envoy.Service.ExtProc.V3.HeaderMutation,
    json_name: "headerMutation"
end

defmodule Envoy.Service.ExtProc.V3.BodyResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :response, 1, type: Envoy.Service.ExtProc.V3.CommonResponse
end

defmodule Envoy.Service.ExtProc.V3.CommonResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1,
    type: Envoy.Service.ExtProc.V3.CommonResponse.ResponseStatus,
    enum: true,
    deprecated: false

  field :header_mutation, 2,
    type: Envoy.Service.ExtProc.V3.HeaderMutation,
    json_name: "headerMutation"

  field :body_mutation, 3, type: Envoy.Service.ExtProc.V3.BodyMutation, json_name: "bodyMutation"
  field :trailers, 4, type: Envoy.Config.Core.V3.HeaderMap
  field :clear_route_cache, 5, type: :bool, json_name: "clearRouteCache"
end

defmodule Envoy.Service.ExtProc.V3.ImmediateResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Envoy.Type.V3.HttpStatus, deprecated: false
  field :headers, 2, type: Envoy.Service.ExtProc.V3.HeaderMutation
  field :body, 3, type: :string
  field :grpc_status, 4, type: Envoy.Service.ExtProc.V3.GrpcStatus, json_name: "grpcStatus"
  field :details, 5, type: :string
end

defmodule Envoy.Service.ExtProc.V3.GrpcStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: :uint32
end

defmodule Envoy.Service.ExtProc.V3.HeaderMutation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :set_headers, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "setHeaders"

  field :remove_headers, 2, repeated: true, type: :string, json_name: "removeHeaders"
end

defmodule Envoy.Service.ExtProc.V3.BodyMutation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :mutation, 0

  field :body, 1, type: :bytes, oneof: 0
  field :clear_body, 2, type: :bool, json_name: "clearBody", oneof: 0
end

defmodule Envoy.Service.ExtProc.V3.ExternalProcessor.Service do
  use GRPC.Service,
    name: "envoy.service.ext_proc.v3.ExternalProcessor",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Process,
      stream(Envoy.Service.ExtProc.V3.ProcessingRequest),
      stream(Envoy.Service.ExtProc.V3.ProcessingResponse)
end

defmodule Envoy.Service.ExtProc.V3.ExternalProcessor.Stub do
  use GRPC.Stub, service: Envoy.Service.ExtProc.V3.ExternalProcessor.Service
end