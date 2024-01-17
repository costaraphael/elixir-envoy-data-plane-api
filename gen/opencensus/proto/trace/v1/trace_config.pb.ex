defmodule Opencensus.Proto.Trace.V1.ConstantSampler.ConstantDecision do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALWAYS_OFF, 0
  field :ALWAYS_ON, 1
  field :ALWAYS_PARENT, 2
end

defmodule Opencensus.Proto.Trace.V1.TraceConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :sampler, 0

  field :probability_sampler, 1,
    type: Opencensus.Proto.Trace.V1.ProbabilitySampler,
    json_name: "probabilitySampler",
    oneof: 0

  field :constant_sampler, 2,
    type: Opencensus.Proto.Trace.V1.ConstantSampler,
    json_name: "constantSampler",
    oneof: 0

  field :rate_limiting_sampler, 3,
    type: Opencensus.Proto.Trace.V1.RateLimitingSampler,
    json_name: "rateLimitingSampler",
    oneof: 0

  field :max_number_of_attributes, 4, type: :int64, json_name: "maxNumberOfAttributes"
  field :max_number_of_annotations, 5, type: :int64, json_name: "maxNumberOfAnnotations"
  field :max_number_of_message_events, 6, type: :int64, json_name: "maxNumberOfMessageEvents"
  field :max_number_of_links, 7, type: :int64, json_name: "maxNumberOfLinks"
end

defmodule Opencensus.Proto.Trace.V1.ProbabilitySampler do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :samplingProbability, 1, type: :double
end

defmodule Opencensus.Proto.Trace.V1.ConstantSampler do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :decision, 1, type: Opencensus.Proto.Trace.V1.ConstantSampler.ConstantDecision, enum: true
end

defmodule Opencensus.Proto.Trace.V1.RateLimitingSampler do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :qps, 1, type: :int64
end