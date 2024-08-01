defmodule Envoy.Extensions.AccessLoggers.Fluentd.V3.FluentdAccessLogConfig.RetryOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_connect_attempts, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts"

  field :backoff_options, 2,
    type: Envoy.Config.Core.V3.BackoffStrategy,
    json_name: "backoffOptions"
end

defmodule Envoy.Extensions.AccessLoggers.Fluentd.V3.FluentdAccessLogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false
  field :tag, 2, type: :string, deprecated: false
  field :stat_prefix, 3, type: :string, json_name: "statPrefix", deprecated: false

  field :buffer_flush_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "bufferFlushInterval",
    deprecated: false

  field :buffer_size_bytes, 5, type: Google.Protobuf.UInt32Value, json_name: "bufferSizeBytes"
  field :record, 6, type: Google.Protobuf.Struct, deprecated: false

  field :retry_options, 7,
    type: Envoy.Extensions.AccessLoggers.Fluentd.V3.FluentdAccessLogConfig.RetryOptions,
    json_name: "retryOptions"

  field :formatters, 8, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
end