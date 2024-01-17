defmodule Envoy.Config.Filter.Http.Squash.V2.Squash do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string, deprecated: false
  field :attachment_template, 2, type: Google.Protobuf.Struct, json_name: "attachmentTemplate"
  field :request_timeout, 3, type: Google.Protobuf.Duration, json_name: "requestTimeout"
  field :attachment_timeout, 4, type: Google.Protobuf.Duration, json_name: "attachmentTimeout"

  field :attachment_poll_period, 5,
    type: Google.Protobuf.Duration,
    json_name: "attachmentPollPeriod"
end