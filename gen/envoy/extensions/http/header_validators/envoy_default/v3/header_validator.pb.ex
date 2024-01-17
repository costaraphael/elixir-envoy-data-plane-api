defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.HeadersWithUnderscoresAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALLOW, 0
  field :REJECT_REQUEST, 1
  field :DROP_HEADER, 2
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions.PathWithEscapedSlashesAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :IMPLEMENTATION_SPECIFIC_DEFAULT, 0
  field :KEEP_UNCHANGED, 1
  field :REJECT_REQUEST, 2
  field :UNESCAPE_AND_REDIRECT, 3
  field :UNESCAPE_AND_FORWARD, 4
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :skip_path_normalization, 1, type: :bool, json_name: "skipPathNormalization"
  field :skip_merging_slashes, 2, type: :bool, json_name: "skipMergingSlashes"

  field :path_with_escaped_slashes_action, 3,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions.PathWithEscapedSlashesAction,
    json_name: "pathWithEscapedSlashesAction",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.Http1ProtocolOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allow_chunked_length, 1, type: :bool, json_name: "allowChunkedLength"
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http1_protocol_options, 1,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.Http1ProtocolOptions,
    json_name: "http1ProtocolOptions"

  field :uri_path_normalization_options, 2,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions,
    json_name: "uriPathNormalizationOptions"

  field :restrict_http_methods, 3, type: :bool, json_name: "restrictHttpMethods"

  field :headers_with_underscores_action, 4,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.HeadersWithUnderscoresAction,
    json_name: "headersWithUnderscoresAction",
    enum: true

  field :strip_fragment_from_path, 5, type: :bool, json_name: "stripFragmentFromPath"
end