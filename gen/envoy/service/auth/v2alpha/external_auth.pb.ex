defmodule Envoy.Service.Auth.V2alpha.Authorization.Service do
  use GRPC.Service,
    name: "envoy.service.auth.v2alpha.Authorization",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Check, Envoy.Service.Auth.V2.CheckRequest, Envoy.Service.Auth.V2.CheckResponse
end

defmodule Envoy.Service.Auth.V2alpha.Authorization.Stub do
  use GRPC.Stub, service: Envoy.Service.Auth.V2alpha.Authorization.Service
end