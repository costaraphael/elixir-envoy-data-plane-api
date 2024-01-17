defmodule Envoy.Service.Metrics.V2.StreamMetricsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Metrics.V2.StreamMetricsMessage.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
end

defmodule Envoy.Service.Metrics.V2.StreamMetricsMessage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.Metrics.V2.StreamMetricsMessage.Identifier

  field :envoy_metrics, 2,
    repeated: true,
    type: Io.Prometheus.Client.MetricFamily,
    json_name: "envoyMetrics"
end

defmodule Envoy.Service.Metrics.V2.MetricsService.Service do
  use GRPC.Service,
    name: "envoy.service.metrics.v2.MetricsService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamMetrics,
      stream(Envoy.Service.Metrics.V2.StreamMetricsMessage),
      Envoy.Service.Metrics.V2.StreamMetricsResponse
end

defmodule Envoy.Service.Metrics.V2.MetricsService.Stub do
  use GRPC.Stub, service: Envoy.Service.Metrics.V2.MetricsService.Service
end