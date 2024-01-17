defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.ExplicitHttpConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :protocol_config, 0

  field :http_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions",
    oneof: 0

  field :http2_protocol_options, 2,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions",
    oneof: 0

  field :http3_protocol_options, 3,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions",
    oneof: 0
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.UseDownstreamHttpConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 2,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"

  field :http3_protocol_options, 3,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions"
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.AutoHttpConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 2,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"

  field :http3_protocol_options, 3,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions"

  field :alternate_protocols_cache_options, 4,
    type: Envoy.Config.Core.V3.AlternateProtocolsCacheOptions,
    json_name: "alternateProtocolsCacheOptions"
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :upstream_protocol_options, 0

  field :common_http_protocol_options, 1,
    type: Envoy.Config.Core.V3.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions"

  field :upstream_http_protocol_options, 2,
    type: Envoy.Config.Core.V3.UpstreamHttpProtocolOptions,
    json_name: "upstreamHttpProtocolOptions"

  field :explicit_http_config, 3,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.ExplicitHttpConfig,
    json_name: "explicitHttpConfig",
    oneof: 0

  field :use_downstream_protocol_config, 4,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.UseDownstreamHttpConfig,
    json_name: "useDownstreamProtocolConfig",
    oneof: 0

  field :auto_config, 5,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.AutoHttpConfig,
    json_name: "autoConfig",
    oneof: 0

  field :http_filters, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter,
    json_name: "httpFilters"

  field :header_validation_config, 7,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "headerValidationConfig"
end