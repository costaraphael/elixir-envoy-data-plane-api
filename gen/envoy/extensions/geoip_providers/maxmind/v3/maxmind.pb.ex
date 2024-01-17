defmodule Envoy.Extensions.GeoipProviders.Maxmind.V3.MaxMindConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :city_db_path, 1, type: :string, json_name: "cityDbPath", deprecated: false
  field :isp_db_path, 2, type: :string, json_name: "ispDbPath", deprecated: false
  field :anon_db_path, 3, type: :string, json_name: "anonDbPath", deprecated: false

  field :common_provider_config, 4,
    type: Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig,
    json_name: "commonProviderConfig",
    deprecated: false
end