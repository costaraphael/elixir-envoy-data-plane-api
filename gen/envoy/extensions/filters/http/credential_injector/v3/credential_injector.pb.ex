defmodule Envoy.Extensions.Filters.Http.CredentialInjector.V3.CredentialInjector do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :overwrite, 1, type: :bool
  field :fail_if_not_present, 2, type: :bool, json_name: "failIfNotPresent"
  field :credential, 3, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end