defmodule Envoy.Extensions.Filters.Http.HealthCheck.V3.HealthCheck.ClusterMinHealthyPercentagesEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Type.V3.Percent
end

defmodule Envoy.Extensions.Filters.Http.HealthCheck.V3.HealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :pass_through_mode, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "passThroughMode",
    deprecated: false

  field :cache_time, 3, type: Google.Protobuf.Duration, json_name: "cacheTime"

  field :cluster_min_healthy_percentages, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.HealthCheck.V3.HealthCheck.ClusterMinHealthyPercentagesEntry,
    json_name: "clusterMinHealthyPercentages",
    map: true

  field :headers, 5, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
end