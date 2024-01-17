defmodule Envoy.Service.LoadStats.V3.LoadStatsRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node

  field :cluster_stats, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterStats,
    json_name: "clusterStats"
end

defmodule Envoy.Service.LoadStats.V3.LoadStatsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clusters, 1, repeated: true, type: :string
  field :send_all_clusters, 4, type: :bool, json_name: "sendAllClusters"

  field :load_reporting_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "loadReportingInterval"

  field :report_endpoint_granularity, 3, type: :bool, json_name: "reportEndpointGranularity"
end

defmodule Envoy.Service.LoadStats.V3.LoadReportingService.Service do
  use GRPC.Service,
    name: "envoy.service.load_stats.v3.LoadReportingService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamLoadStats,
      stream(Envoy.Service.LoadStats.V3.LoadStatsRequest),
      stream(Envoy.Service.LoadStats.V3.LoadStatsResponse)
end

defmodule Envoy.Service.LoadStats.V3.LoadReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.LoadStats.V3.LoadReportingService.Service
end