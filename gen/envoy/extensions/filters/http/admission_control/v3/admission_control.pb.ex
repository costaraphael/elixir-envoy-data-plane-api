defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.HttpCriteria do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_success_status, 1,
    repeated: true,
    type: Envoy.Type.V3.Int32Range,
    json_name: "httpSuccessStatus",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.GrpcCriteria do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :grpc_success_status, 1,
    repeated: true,
    type: :uint32,
    json_name: "grpcSuccessStatus",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_criteria, 1,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.HttpCriteria,
    json_name: "httpCriteria"

  field :grpc_criteria, 2,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.GrpcCriteria,
    json_name: "grpcCriteria"
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :evaluation_criteria, 0

  field :enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag

  field :success_criteria, 2,
    type: Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria,
    json_name: "successCriteria",
    oneof: 0

  field :sampling_window, 3, type: Google.Protobuf.Duration, json_name: "samplingWindow"
  field :aggression, 4, type: Envoy.Config.Core.V3.RuntimeDouble
  field :sr_threshold, 5, type: Envoy.Config.Core.V3.RuntimePercent, json_name: "srThreshold"
  field :rps_threshold, 6, type: Envoy.Config.Core.V3.RuntimeUInt32, json_name: "rpsThreshold"

  field :max_rejection_probability, 7,
    type: Envoy.Config.Core.V3.RuntimePercent,
    json_name: "maxRejectionProbability"
end