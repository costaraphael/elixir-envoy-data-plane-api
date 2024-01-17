defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNSPECIFIED, 0
  field :HTTP_DOWNSTREAM_CONNECTION_IDLE, 1
  field :HTTP_DOWNSTREAM_STREAM_IDLE, 2
  field :TRANSPORT_SOCKET_CONNECT, 3
end

defmodule Envoy.Config.Overload.V3.ResourceMonitor do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Overload.V3.ThresholdTrigger do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: :double, deprecated: false
end

defmodule Envoy.Config.Overload.V3.ScaledTrigger do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :scaling_threshold, 1, type: :double, json_name: "scalingThreshold", deprecated: false

  field :saturation_threshold, 2,
    type: :double,
    json_name: "saturationThreshold",
    deprecated: false
end

defmodule Envoy.Config.Overload.V3.Trigger do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :trigger_oneof, 0

  field :name, 1, type: :string, deprecated: false
  field :threshold, 2, type: Envoy.Config.Overload.V3.ThresholdTrigger, oneof: 0
  field :scaled, 3, type: Envoy.Config.Overload.V3.ScaledTrigger, oneof: 0
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :overload_adjust, 0

  field :timer, 1,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType,
    enum: true,
    deprecated: false

  field :min_timeout, 2, type: Google.Protobuf.Duration, json_name: "minTimeout", oneof: 0
  field :min_scale, 3, type: Envoy.Type.V3.Percent, json_name: "minScale", oneof: 0
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :timer_scale_factors, 1,
    repeated: true,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer,
    json_name: "timerScaleFactors",
    deprecated: false
end

defmodule Envoy.Config.Overload.V3.OverloadAction do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :triggers, 2, repeated: true, type: Envoy.Config.Overload.V3.Trigger, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Config.Overload.V3.LoadShedPoint do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :triggers, 2, repeated: true, type: Envoy.Config.Overload.V3.Trigger, deprecated: false
end

defmodule Envoy.Config.Overload.V3.BufferFactoryConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :minimum_account_to_track_power_of_two, 1,
    type: :uint32,
    json_name: "minimumAccountToTrackPowerOfTwo",
    deprecated: false
end

defmodule Envoy.Config.Overload.V3.OverloadManager do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :refresh_interval, 1, type: Google.Protobuf.Duration, json_name: "refreshInterval"

  field :resource_monitors, 2,
    repeated: true,
    type: Envoy.Config.Overload.V3.ResourceMonitor,
    json_name: "resourceMonitors",
    deprecated: false

  field :actions, 3, repeated: true, type: Envoy.Config.Overload.V3.OverloadAction

  field :loadshed_points, 5,
    repeated: true,
    type: Envoy.Config.Overload.V3.LoadShedPoint,
    json_name: "loadshedPoints"

  field :buffer_factory_config, 4,
    type: Envoy.Config.Overload.V3.BufferFactoryConfig,
    json_name: "bufferFactoryConfig"
end