defmodule Envoy.Service.Metrics.V3.StreamMetricsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Metrics.V3.StreamMetricsMessage.Identifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
end

defmodule Envoy.Service.Metrics.V3.StreamMetricsMessage do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: Envoy.Service.Metrics.V3.StreamMetricsMessage.Identifier

  field :envoy_metrics, 2,
    repeated: true,
    type: Io.Prometheus.Client.MetricFamily,
    json_name: "envoyMetrics"
end

defmodule Envoy.Service.Metrics.V3.MetricsService.Service do
  use GRPC.Service,
    name: "envoy.service.metrics.v3.MetricsService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamMetrics,
      stream(Envoy.Service.Metrics.V3.StreamMetricsMessage),
      Envoy.Service.Metrics.V3.StreamMetricsResponse
end

defmodule Envoy.Service.Metrics.V3.MetricsService.Stub do
  use GRPC.Stub, service: Envoy.Service.Metrics.V3.MetricsService.Service
end