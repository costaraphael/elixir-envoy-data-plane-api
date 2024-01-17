defmodule Envoy.Config.Core.V3.ApiVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO, 0
  field :V2, 1
  field :V3, 2
end

defmodule Envoy.Config.Core.V3.ApiConfigSource.ApiType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0
  field :REST, 1
  field :GRPC, 2
  field :DELTA_GRPC, 3
  field :AGGREGATED_GRPC, 5
  field :AGGREGATED_DELTA_GRPC, 6
end

defmodule Envoy.Config.Core.V3.ApiConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :api_type, 1,
    type: Envoy.Config.Core.V3.ApiConfigSource.ApiType,
    json_name: "apiType",
    enum: true,
    deprecated: false

  field :transport_api_version, 8,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :cluster_names, 2, repeated: true, type: :string, json_name: "clusterNames"

  field :grpc_services, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcServices"

  field :refresh_delay, 3, type: Google.Protobuf.Duration, json_name: "refreshDelay"

  field :request_timeout, 5,
    type: Google.Protobuf.Duration,
    json_name: "requestTimeout",
    deprecated: false

  field :rate_limit_settings, 6,
    type: Envoy.Config.Core.V3.RateLimitSettings,
    json_name: "rateLimitSettings"

  field :set_node_on_first_message_only, 7, type: :bool, json_name: "setNodeOnFirstMessageOnly"

  field :config_validators, 9,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "configValidators"
end

defmodule Envoy.Config.Core.V3.AggregatedConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Config.Core.V3.SelfConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :transport_api_version, 1,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.RateLimitSettings do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_tokens, 1, type: Google.Protobuf.UInt32Value, json_name: "maxTokens"
  field :fill_rate, 2, type: Google.Protobuf.DoubleValue, json_name: "fillRate", deprecated: false
end

defmodule Envoy.Config.Core.V3.PathConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :path, 1, type: :string, deprecated: false

  field :watched_directory, 2,
    type: Envoy.Config.Core.V3.WatchedDirectory,
    json_name: "watchedDirectory"
end

defmodule Envoy.Config.Core.V3.ConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_source_specifier, 0

  field :authorities, 7, repeated: true, type: Xds.Core.V3.Authority
  field :path, 1, type: :string, oneof: 0, deprecated: true

  field :path_config_source, 8,
    type: Envoy.Config.Core.V3.PathConfigSource,
    json_name: "pathConfigSource",
    oneof: 0

  field :api_config_source, 2,
    type: Envoy.Config.Core.V3.ApiConfigSource,
    json_name: "apiConfigSource",
    oneof: 0

  field :ads, 3, type: Envoy.Config.Core.V3.AggregatedConfigSource, oneof: 0
  field :self, 5, type: Envoy.Config.Core.V3.SelfConfigSource, oneof: 0

  field :initial_fetch_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "initialFetchTimeout"

  field :resource_api_version, 6,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "resourceApiVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.ExtensionConfigSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :default_config, 2, type: Google.Protobuf.Any, json_name: "defaultConfig"

  field :apply_default_config_without_warming, 3,
    type: :bool,
    json_name: "applyDefaultConfigWithoutWarming"

  field :type_urls, 4, repeated: true, type: :string, json_name: "typeUrls", deprecated: false
end