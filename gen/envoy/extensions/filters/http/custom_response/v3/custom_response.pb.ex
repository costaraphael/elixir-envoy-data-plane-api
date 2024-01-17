defmodule Envoy.Extensions.Filters.Http.CustomResponse.V3.CustomResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :custom_response_matcher, 1,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "customResponseMatcher"
end