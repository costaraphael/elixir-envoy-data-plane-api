defmodule Envoy.Config.Trace.V3.Tracing.Http do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Trace.V3.Tracing do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http, 1, type: Envoy.Config.Trace.V3.Tracing.Http
end