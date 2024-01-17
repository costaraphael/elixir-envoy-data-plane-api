defmodule Envoy.Extensions.Common.Matching.V3.ExtensionWithMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :matcher, 1, type: Envoy.Config.Common.Matcher.V3.Matcher, deprecated: true
  field :xds_matcher, 3, type: Xds.Type.Matcher.V3.Matcher, json_name: "xdsMatcher"

  field :extension_config, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "extensionConfig",
    deprecated: false
end

defmodule Envoy.Extensions.Common.Matching.V3.ExtensionWithMatcherPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :xds_matcher, 1, type: Xds.Type.Matcher.V3.Matcher, json_name: "xdsMatcher"
end