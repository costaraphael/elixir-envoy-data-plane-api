defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthz do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :services, 0

  field :grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService, json_name: "grpcService", oneof: 0

  field :http_service, 3,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService,
    json_name: "httpService",
    oneof: 0

  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"
  field :use_alpha, 4, type: :bool, json_name: "useAlpha", deprecated: true

  field :with_request_body, 5,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings,
    json_name: "withRequestBody"

  field :clear_route_cache, 6, type: :bool, json_name: "clearRouteCache"
  field :status_on_error, 7, type: Envoy.Type.HttpStatus, json_name: "statusOnError"

  field :metadata_context_namespaces, 8,
    repeated: true,
    type: :string,
    json_name: "metadataContextNamespaces"

  field :filter_enabled, 9,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :deny_at_disable, 11,
    type: Envoy.Api.V2.Core.RuntimeFeatureFlag,
    json_name: "denyAtDisable"

  field :include_peer_certificate, 10, type: :bool, json_name: "includePeerCertificate"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_request_bytes, 1, type: :uint32, json_name: "maxRequestBytes", deprecated: false
  field :allow_partial_message, 2, type: :bool, json_name: "allowPartialMessage"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :server_uri, 1, type: Envoy.Api.V2.Core.HttpUri, json_name: "serverUri"
  field :path_prefix, 2, type: :string, json_name: "pathPrefix"

  field :authorization_request, 7,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest,
    json_name: "authorizationRequest"

  field :authorization_response, 8,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse,
    json_name: "authorizationResponse"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allowed_headers, 1,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "allowedHeaders"

  field :headers_to_add, 2,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValue,
    json_name: "headersToAdd"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allowed_upstream_headers, 1,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "allowedUpstreamHeaders"

  field :allowed_client_headers, 2,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "allowedClientHeaders"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthzPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :check_settings, 2,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings,
    json_name: "checkSettings",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :context_extensions, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry,
    json_name: "contextExtensions",
    map: true
end