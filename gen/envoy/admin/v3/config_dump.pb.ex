defmodule Envoy.Admin.V3.ConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :configs, 1, repeated: true, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V3.BootstrapConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bootstrap, 1, type: Envoy.Config.Bootstrap.V3.Bootstrap
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.SecretsConfigDump.DynamicSecret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 4, type: Google.Protobuf.Any
  field :error_state, 5, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 6,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.SecretsConfigDump.StaticSecret do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 3, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V3.SecretsConfigDump do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :static_secrets, 1,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.StaticSecret,
    json_name: "staticSecrets"

  field :dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicActiveSecrets"

  field :dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicWarmingSecrets"
end