defmodule Envoy.Extensions.Filters.Http.Geoip.V3.Geoip.XffConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :xff_num_trusted_hops, 1, type: :uint32, json_name: "xffNumTrustedHops"
end

defmodule Envoy.Extensions.Filters.Http.Geoip.V3.Geoip do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :xff_config, 1,
    type: Envoy.Extensions.Filters.Http.Geoip.V3.Geoip.XffConfig,
    json_name: "xffConfig"

  field :provider, 3, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end