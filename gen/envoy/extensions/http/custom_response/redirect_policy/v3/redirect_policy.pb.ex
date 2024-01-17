defmodule Envoy.Extensions.Http.CustomResponse.RedirectPolicy.V3.RedirectPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :redirect_action_specifier, 0

  field :uri, 1, type: :string, oneof: 0, deprecated: false

  field :redirect_action, 2,
    type: Envoy.Config.Route.V3.RedirectAction,
    json_name: "redirectAction",
    oneof: 0

  field :status_code, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "statusCode",
    deprecated: false

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :request_headers_to_add, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :modify_request_headers_action, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "modifyRequestHeadersAction"
end