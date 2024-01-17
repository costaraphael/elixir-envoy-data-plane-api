defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.FaultDelayType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :FIXED, 0
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.HeaderDelay do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :fault_delay_secifier, 0

  field :fixed_delay, 3,
    type: Google.Protobuf.Duration,
    json_name: "fixedDelay",
    oneof: 0,
    deprecated: false

  field :header_delay, 5,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.HeaderDelay,
    json_name: "headerDelay",
    oneof: 0

  field :percentage, 4, type: Envoy.Type.V3.FractionalPercent
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.FixedLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :limit_kbps, 1, type: :uint64, json_name: "limitKbps", deprecated: false
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.HeaderLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :limit_type, 0

  field :fixed_limit, 1,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.FixedLimit,
    json_name: "fixedLimit",
    oneof: 0

  field :header_limit, 3,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.HeaderLimit,
    json_name: "headerLimit",
    oneof: 0

  field :percentage, 2, type: Envoy.Type.V3.FractionalPercent
end