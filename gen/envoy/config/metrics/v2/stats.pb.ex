defmodule Envoy.Config.Metrics.V2.StatsSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Metrics.V2.StatsConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stats_tags, 1,
    repeated: true,
    type: Envoy.Config.Metrics.V2.TagSpecifier,
    json_name: "statsTags"

  field :use_all_default_tags, 2, type: Google.Protobuf.BoolValue, json_name: "useAllDefaultTags"
  field :stats_matcher, 3, type: Envoy.Config.Metrics.V2.StatsMatcher, json_name: "statsMatcher"
end

defmodule Envoy.Config.Metrics.V2.StatsMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :stats_matcher, 0

  field :reject_all, 1, type: :bool, json_name: "rejectAll", oneof: 0

  field :exclusion_list, 2,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "exclusionList",
    oneof: 0

  field :inclusion_list, 3,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "inclusionList",
    oneof: 0
end

defmodule Envoy.Config.Metrics.V2.TagSpecifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :tag_value, 0

  field :tag_name, 1, type: :string, json_name: "tagName"
  field :regex, 2, type: :string, oneof: 0, deprecated: false
  field :fixed_value, 3, type: :string, json_name: "fixedValue", oneof: 0
end

defmodule Envoy.Config.Metrics.V2.StatsdSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :statsd_specifier, 0

  field :address, 1, type: Envoy.Api.V2.Core.Address, oneof: 0
  field :tcp_cluster_name, 2, type: :string, json_name: "tcpClusterName", oneof: 0
  field :prefix, 3, type: :string
end

defmodule Envoy.Config.Metrics.V2.DogStatsdSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :dog_statsd_specifier, 0

  field :address, 1, type: Envoy.Api.V2.Core.Address, oneof: 0
  field :prefix, 3, type: :string
end

defmodule Envoy.Config.Metrics.V2.HystrixSink do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :num_buckets, 1, type: :int64, json_name: "numBuckets"
end