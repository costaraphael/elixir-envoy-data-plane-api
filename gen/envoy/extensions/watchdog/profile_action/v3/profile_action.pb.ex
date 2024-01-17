defmodule Envoy.Extensions.Watchdog.ProfileAction.V3.ProfileActionConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :profile_duration, 1, type: Google.Protobuf.Duration, json_name: "profileDuration"
  field :profile_path, 2, type: :string, json_name: "profilePath", deprecated: false
  field :max_profiles, 3, type: :uint64, json_name: "maxProfiles"
end