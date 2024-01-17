defmodule Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.KafkaBroker do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :broker_address_rewrite_spec, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :force_response_rewrite, 2, type: :bool, json_name: "forceResponseRewrite"

  field :id_based_broker_address_rewrite_spec, 3,
    type: Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteSpec,
    json_name: "idBasedBrokerAddressRewriteSpec",
    oneof: 0
end

defmodule Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteSpec do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteRule
end

defmodule Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteRule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: :uint32, deprecated: false
  field :host, 2, type: :string, deprecated: false
  field :port, 3, type: :uint32, deprecated: false
end