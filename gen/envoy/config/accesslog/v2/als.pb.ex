defmodule Envoy.Config.Accesslog.V2.HttpGrpcAccessLogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: false

  field :additional_request_headers_to_log, 2,
    repeated: true,
    type: :string,
    json_name: "additionalRequestHeadersToLog"

  field :additional_response_headers_to_log, 3,
    repeated: true,
    type: :string,
    json_name: "additionalResponseHeadersToLog"

  field :additional_response_trailers_to_log, 4,
    repeated: true,
    type: :string,
    json_name: "additionalResponseTrailersToLog"
end

defmodule Envoy.Config.Accesslog.V2.TcpGrpcAccessLogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :common_config, 1,
    type: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: false
end

defmodule Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :log_name, 1, type: :string, json_name: "logName", deprecated: false

  field :grpc_service, 2,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :buffer_flush_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "bufferFlushInterval",
    deprecated: false

  field :buffer_size_bytes, 4, type: Google.Protobuf.UInt32Value, json_name: "bufferSizeBytes"

  field :filter_state_objects_to_log, 5,
    repeated: true,
    type: :string,
    json_name: "filterStateObjectsToLog"
end