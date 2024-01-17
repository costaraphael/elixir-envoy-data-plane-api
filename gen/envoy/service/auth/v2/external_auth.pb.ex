defmodule Envoy.Service.Auth.V2.CheckRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Envoy.Service.Auth.V2.AttributeContext
end

defmodule Envoy.Service.Auth.V2.DeniedHttpResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Envoy.Type.HttpStatus, deprecated: false
  field :headers, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption
  field :body, 3, type: :string
end

defmodule Envoy.Service.Auth.V2.OkHttpResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption
end

defmodule Envoy.Service.Auth.V2.CheckResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :http_response, 0

  field :status, 1, type: Google.Rpc.Status

  field :denied_response, 2,
    type: Envoy.Service.Auth.V2.DeniedHttpResponse,
    json_name: "deniedResponse",
    oneof: 0

  field :ok_response, 3,
    type: Envoy.Service.Auth.V2.OkHttpResponse,
    json_name: "okResponse",
    oneof: 0
end

defmodule Envoy.Service.Auth.V2.Authorization.Service do
  use GRPC.Service,
    name: "envoy.service.auth.v2.Authorization",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Check, Envoy.Service.Auth.V2.CheckRequest, Envoy.Service.Auth.V2.CheckResponse
end

defmodule Envoy.Service.Auth.V2.Authorization.Stub do
  use GRPC.Stub, service: Envoy.Service.Auth.V2.Authorization.Service
end