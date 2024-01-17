defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.ConcurrencyLimitCalculationParams do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_concurrency_limit, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrencyLimit",
    deprecated: false

  field :concurrency_update_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "concurrencyUpdateInterval",
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.MinimumRTTCalculationParams do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :interval, 1, type: Google.Protobuf.Duration, deprecated: false

  field :request_count, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "requestCount",
    deprecated: false

  field :jitter, 3, type: Envoy.Type.Percent

  field :min_concurrency, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "minConcurrency",
    deprecated: false

  field :buffer, 5, type: Envoy.Type.Percent
end

defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :sample_aggregate_percentile, 1,
    type: Envoy.Type.Percent,
    json_name: "sampleAggregatePercentile"

  field :concurrency_limit_params, 2,
    type:
      Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.ConcurrencyLimitCalculationParams,
    json_name: "concurrencyLimitParams",
    deprecated: false

  field :min_rtt_calc_params, 3,
    type:
      Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.MinimumRTTCalculationParams,
    json_name: "minRttCalcParams",
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.AdaptiveConcurrency do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :concurrency_controller_config, 0

  field :gradient_controller_config, 1,
    type: Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig,
    json_name: "gradientControllerConfig",
    oneof: 0,
    deprecated: false

  field :enabled, 2, type: Envoy.Api.V2.Core.RuntimeFeatureFlag
end