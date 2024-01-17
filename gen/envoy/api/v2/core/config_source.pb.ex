defmodule Envoy.Api.V2.Core.ApiVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO, 0
  field :V2, 1
  field :V3, 2
end

defmodule Envoy.Api.V2.Core.ApiConfigSource.ApiType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNSUPPORTED_REST_LEGACY, 0
  field :REST, 1
  field :GRPC, 2
  field :DELTA_GRPC, 3
end

defmodule Envoy.Api.V2.Core.ApiConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :api_type, 1,
    type: Envoy.Api.V2.Core.ApiConfigSource.ApiType,
    json_name: "apiType",
    enum: true,
    deprecated: false

  field :transport_api_version, 8,
    type: Envoy.Api.V2.Core.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :cluster_names, 2, repeated: true, type: :string, json_name: "clusterNames"

  field :grpc_services, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcServices"

  field :refresh_delay, 3, type: Google.Protobuf.Duration, json_name: "refreshDelay"

  field :request_timeout, 5,
    type: Google.Protobuf.Duration,
    json_name: "requestTimeout",
    deprecated: false

  field :rate_limit_settings, 6,
    type: Envoy.Api.V2.Core.RateLimitSettings,
    json_name: "rateLimitSettings"

  field :set_node_on_first_message_only, 7, type: :bool, json_name: "setNodeOnFirstMessageOnly"
end

defmodule Envoy.Api.V2.Core.AggregatedConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.Core.SelfConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :transport_api_version, 1,
    type: Envoy.Api.V2.Core.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Api.V2.Core.RateLimitSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_tokens, 1, type: Google.Protobuf.UInt32Value, json_name: "maxTokens"
  field :fill_rate, 2, type: Google.Protobuf.DoubleValue, json_name: "fillRate", deprecated: false
end

defmodule Envoy.Api.V2.Core.ConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_source_specifier, 0

  field :path, 1, type: :string, oneof: 0

  field :api_config_source, 2,
    type: Envoy.Api.V2.Core.ApiConfigSource,
    json_name: "apiConfigSource",
    oneof: 0

  field :ads, 3, type: Envoy.Api.V2.Core.AggregatedConfigSource, oneof: 0
  field :self, 5, type: Envoy.Api.V2.Core.SelfConfigSource, oneof: 0

  field :initial_fetch_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "initialFetchTimeout"

  field :resource_api_version, 6,
    type: Envoy.Api.V2.Core.ApiVersion,
    json_name: "resourceApiVersion",
    enum: true,
    deprecated: false
end