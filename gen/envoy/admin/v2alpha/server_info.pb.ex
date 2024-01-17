defmodule Envoy.Admin.V2alpha.ServerInfo.State do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :LIVE, 0
  field :DRAINING, 1
  field :PRE_INITIALIZING, 2
  field :INITIALIZING, 3
end

defmodule Envoy.Admin.V2alpha.CommandLineOptions.IpVersion do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :v4, 0
  field :v6, 1
end

defmodule Envoy.Admin.V2alpha.CommandLineOptions.Mode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Serve, 0
  field :Validate, 1
  field :InitOnly, 2
end

defmodule Envoy.Admin.V2alpha.ServerInfo do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version, 1, type: :string
  field :state, 2, type: Envoy.Admin.V2alpha.ServerInfo.State, enum: true
  field :uptime_current_epoch, 3, type: Google.Protobuf.Duration, json_name: "uptimeCurrentEpoch"
  field :uptime_all_epochs, 4, type: Google.Protobuf.Duration, json_name: "uptimeAllEpochs"
  field :hot_restart_version, 5, type: :string, json_name: "hotRestartVersion"

  field :command_line_options, 6,
    type: Envoy.Admin.V2alpha.CommandLineOptions,
    json_name: "commandLineOptions"
end

defmodule Envoy.Admin.V2alpha.CommandLineOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :base_id, 1, type: :uint64, json_name: "baseId"
  field :concurrency, 2, type: :uint32
  field :config_path, 3, type: :string, json_name: "configPath"
  field :config_yaml, 4, type: :string, json_name: "configYaml"
  field :allow_unknown_static_fields, 5, type: :bool, json_name: "allowUnknownStaticFields"
  field :reject_unknown_dynamic_fields, 26, type: :bool, json_name: "rejectUnknownDynamicFields"
  field :admin_address_path, 6, type: :string, json_name: "adminAddressPath"

  field :local_address_ip_version, 7,
    type: Envoy.Admin.V2alpha.CommandLineOptions.IpVersion,
    json_name: "localAddressIpVersion",
    enum: true

  field :log_level, 8, type: :string, json_name: "logLevel"
  field :component_log_level, 9, type: :string, json_name: "componentLogLevel"
  field :log_format, 10, type: :string, json_name: "logFormat"
  field :log_format_escaped, 27, type: :bool, json_name: "logFormatEscaped"
  field :log_path, 11, type: :string, json_name: "logPath"
  field :service_cluster, 13, type: :string, json_name: "serviceCluster"
  field :service_node, 14, type: :string, json_name: "serviceNode"
  field :service_zone, 15, type: :string, json_name: "serviceZone"
  field :file_flush_interval, 16, type: Google.Protobuf.Duration, json_name: "fileFlushInterval"
  field :drain_time, 17, type: Google.Protobuf.Duration, json_name: "drainTime"
  field :parent_shutdown_time, 18, type: Google.Protobuf.Duration, json_name: "parentShutdownTime"
  field :mode, 19, type: Envoy.Admin.V2alpha.CommandLineOptions.Mode, enum: true
  field :max_stats, 20, type: :uint64, json_name: "maxStats", deprecated: true
  field :max_obj_name_len, 21, type: :uint64, json_name: "maxObjNameLen", deprecated: true
  field :disable_hot_restart, 22, type: :bool, json_name: "disableHotRestart"
  field :enable_mutex_tracing, 23, type: :bool, json_name: "enableMutexTracing"
  field :restart_epoch, 24, type: :uint32, json_name: "restartEpoch"
  field :cpuset_threads, 25, type: :bool, json_name: "cpusetThreads"
  field :disabled_extensions, 28, repeated: true, type: :string, json_name: "disabledExtensions"
end