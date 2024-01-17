defmodule Envoy.Extensions.Filters.Http.StatefulSession.V3.StatefulSession do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :session_state, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "sessionState"

  field :strict, 2, type: :bool
end

defmodule Envoy.Extensions.Filters.Http.StatefulSession.V3.StatefulSessionPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :stateful_session, 2,
    type: Envoy.Extensions.Filters.Http.StatefulSession.V3.StatefulSession,
    json_name: "statefulSession",
    oneof: 0
end