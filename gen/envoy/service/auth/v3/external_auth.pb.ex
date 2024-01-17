defmodule Envoy.Service.Auth.V3.CheckRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Envoy.Service.Auth.V3.AttributeContext
end

defmodule Envoy.Service.Auth.V3.DeniedHttpResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Envoy.Type.V3.HttpStatus
  field :headers, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption
  field :body, 3, type: :string
end

defmodule Envoy.Service.Auth.V3.OkHttpResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption
  field :headers_to_remove, 5, repeated: true, type: :string, json_name: "headersToRemove"

  field :dynamic_metadata, 3,
    type: Google.Protobuf.Struct,
    json_name: "dynamicMetadata",
    deprecated: true

  field :response_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd"

  field :query_parameters_to_set, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.QueryParameter,
    json_name: "queryParametersToSet"

  field :query_parameters_to_remove, 8,
    repeated: true,
    type: :string,
    json_name: "queryParametersToRemove"
end

defmodule Envoy.Service.Auth.V3.CheckResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :http_response, 0

  field :status, 1, type: Google.Rpc.Status

  field :denied_response, 2,
    type: Envoy.Service.Auth.V3.DeniedHttpResponse,
    json_name: "deniedResponse",
    oneof: 0

  field :ok_response, 3,
    type: Envoy.Service.Auth.V3.OkHttpResponse,
    json_name: "okResponse",
    oneof: 0

  field :dynamic_metadata, 4, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"
end

defmodule Envoy.Service.Auth.V3.Authorization.Service do
  use GRPC.Service,
    name: "envoy.service.auth.v3.Authorization",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Check, Envoy.Service.Auth.V3.CheckRequest, Envoy.Service.Auth.V3.CheckResponse
end

defmodule Envoy.Service.Auth.V3.Authorization.Stub do
  use GRPC.Stub, service: Envoy.Service.Auth.V3.Authorization.Service
end