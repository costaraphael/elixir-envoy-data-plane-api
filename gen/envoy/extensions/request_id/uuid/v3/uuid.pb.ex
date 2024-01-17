defmodule Envoy.Extensions.RequestId.Uuid.V3.UuidRequestIdConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :pack_trace_reason, 1, type: Google.Protobuf.BoolValue, json_name: "packTraceReason"

  field :use_request_id_for_trace_sampling, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "useRequestIdForTraceSampling"
end