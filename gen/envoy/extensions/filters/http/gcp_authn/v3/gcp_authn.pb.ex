defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.GcpAuthnFilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: true
  field :retry_policy, 2, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"

  field :cache_config, 3,
    type: Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenCacheConfig,
    json_name: "cacheConfig"

  field :token_header, 4,
    type: Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenHeader,
    json_name: "tokenHeader"

  field :cluster, 5, type: :string
  field :timeout, 6, type: Google.Protobuf.Duration, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.Audience do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :url, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenCacheConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cache_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "cacheSize",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenHeader do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :value_prefix, 2, type: :string, json_name: "valuePrefix", deprecated: false
end