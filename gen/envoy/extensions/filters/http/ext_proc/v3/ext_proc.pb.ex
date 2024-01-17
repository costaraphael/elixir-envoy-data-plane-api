defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"

  field :processing_mode, 3,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :async_mode, 4, type: :bool, json_name: "asyncMode"
  field :request_attributes, 5, repeated: true, type: :string, json_name: "requestAttributes"
  field :response_attributes, 6, repeated: true, type: :string, json_name: "responseAttributes"

  field :message_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "messageTimeout",
    deprecated: false

  field :stat_prefix, 8, type: :string, json_name: "statPrefix"

  field :mutation_rules, 9,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutationRules,
    json_name: "mutationRules"

  field :max_message_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "maxMessageTimeout",
    deprecated: false

  field :disable_clear_route_cache, 11, type: :bool, json_name: "disableClearRouteCache"

  field :forward_rules, 12,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.HeaderForwardingRules,
    json_name: "forwardRules"

  field :filter_metadata, 13, type: Google.Protobuf.Struct, json_name: "filterMetadata"
  field :allow_mode_override, 14, type: :bool, json_name: "allowModeOverride"
  field :disable_immediate_response, 15, type: :bool, json_name: "disableImmediateResponse"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.HeaderForwardingRules do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allowed_headers, 1,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedHeaders"

  field :disallowed_headers, 2,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "disallowedHeaders"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :overrides, 2, type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcOverrides, oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcOverrides do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :processing_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :async_mode, 2, type: :bool, json_name: "asyncMode"
  field :request_attributes, 3, repeated: true, type: :string, json_name: "requestAttributes"
  field :response_attributes, 4, repeated: true, type: :string, json_name: "responseAttributes"
  field :grpc_service, 5, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"
end