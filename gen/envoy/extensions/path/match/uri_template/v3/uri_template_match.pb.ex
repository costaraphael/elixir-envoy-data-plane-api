defmodule Envoy.Extensions.Path.Match.UriTemplate.V3.UriTemplateMatchConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :path_template, 1, type: :string, json_name: "pathTemplate", deprecated: false
end