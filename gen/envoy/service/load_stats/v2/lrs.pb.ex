defmodule Envoy.Service.LoadStats.V2.LoadStatsRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Api.V2.Core.Node

  field :cluster_stats, 2,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.ClusterStats,
    json_name: "clusterStats"
end

defmodule Envoy.Service.LoadStats.V2.LoadStatsResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clusters, 1, repeated: true, type: :string
  field :send_all_clusters, 4, type: :bool, json_name: "sendAllClusters"

  field :load_reporting_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "loadReportingInterval"

  field :report_endpoint_granularity, 3, type: :bool, json_name: "reportEndpointGranularity"
end

defmodule Envoy.Service.LoadStats.V2.LoadReportingService.Service do
  use GRPC.Service,
    name: "envoy.service.load_stats.v2.LoadReportingService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamLoadStats,
      stream(Envoy.Service.LoadStats.V2.LoadStatsRequest),
      stream(Envoy.Service.LoadStats.V2.LoadStatsResponse)
end

defmodule Envoy.Service.LoadStats.V2.LoadReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.LoadStats.V2.LoadReportingService.Service
end