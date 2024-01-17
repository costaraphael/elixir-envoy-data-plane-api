defmodule Envoy.Config.Common.Matcher.V3.Matcher.OnMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :on_match, 0

  field :matcher, 1, type: Envoy.Config.Common.Matcher.V3.Matcher, oneof: 0
  field :action, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate.SinglePredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :matcher, 0

  field :input, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false

  field :value_match, 2,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "valueMatch",
    oneof: 0

  field :custom_match, 3,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customMatch",
    oneof: 0
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :predicate, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate,
    deprecated: false
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :match_type, 0

  field :single_predicate, 1,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate.SinglePredicate,
    json_name: "singlePredicate",
    oneof: 0

  field :or_matcher, 2,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList,
    json_name: "orMatcher",
    oneof: 0

  field :and_matcher, 3,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList,
    json_name: "andMatcher",
    oneof: 0

  field :not_matcher, 4,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate,
    json_name: "notMatcher",
    oneof: 0
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.FieldMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :predicate, 1,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.Predicate,
    deprecated: false

  field :on_match, 2,
    type: Envoy.Config.Common.Matcher.V3.Matcher.OnMatch,
    json_name: "onMatch",
    deprecated: false
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :matchers, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList.FieldMatcher,
    deprecated: false
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree.MatchMap.MapEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Common.Matcher.V3.Matcher.OnMatch
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree.MatchMap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :map, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree.MatchMap.MapEntry,
    map: true,
    deprecated: false
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :tree_type, 0

  field :input, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false

  field :exact_match_map, 2,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree.MatchMap,
    json_name: "exactMatchMap",
    oneof: 0

  field :prefix_match_map, 3,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree.MatchMap,
    json_name: "prefixMatchMap",
    oneof: 0

  field :custom_match, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customMatch",
    oneof: 0
end

defmodule Envoy.Config.Common.Matcher.V3.Matcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :matcher_type, 0

  field :matcher_list, 1,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherList,
    json_name: "matcherList",
    oneof: 0

  field :matcher_tree, 2,
    type: Envoy.Config.Common.Matcher.V3.Matcher.MatcherTree,
    json_name: "matcherTree",
    oneof: 0

  field :on_no_match, 3,
    type: Envoy.Config.Common.Matcher.V3.Matcher.OnMatch,
    json_name: "onNoMatch"
end

defmodule Envoy.Config.Common.Matcher.V3.MatchPredicate.MatchSet do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V3.MatchPredicate,
    deprecated: false
end

defmodule Envoy.Config.Common.Matcher.V3.MatchPredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :or_match, 1,
    type: Envoy.Config.Common.Matcher.V3.MatchPredicate.MatchSet,
    json_name: "orMatch",
    oneof: 0

  field :and_match, 2,
    type: Envoy.Config.Common.Matcher.V3.MatchPredicate.MatchSet,
    json_name: "andMatch",
    oneof: 0

  field :not_match, 3,
    type: Envoy.Config.Common.Matcher.V3.MatchPredicate,
    json_name: "notMatch",
    oneof: 0

  field :any_match, 4, type: :bool, json_name: "anyMatch", oneof: 0, deprecated: false

  field :http_request_headers_match, 5,
    type: Envoy.Config.Common.Matcher.V3.HttpHeadersMatch,
    json_name: "httpRequestHeadersMatch",
    oneof: 0

  field :http_request_trailers_match, 6,
    type: Envoy.Config.Common.Matcher.V3.HttpHeadersMatch,
    json_name: "httpRequestTrailersMatch",
    oneof: 0

  field :http_response_headers_match, 7,
    type: Envoy.Config.Common.Matcher.V3.HttpHeadersMatch,
    json_name: "httpResponseHeadersMatch",
    oneof: 0

  field :http_response_trailers_match, 8,
    type: Envoy.Config.Common.Matcher.V3.HttpHeadersMatch,
    json_name: "httpResponseTrailersMatch",
    oneof: 0

  field :http_request_generic_body_match, 9,
    type: Envoy.Config.Common.Matcher.V3.HttpGenericBodyMatch,
    json_name: "httpRequestGenericBodyMatch",
    oneof: 0

  field :http_response_generic_body_match, 10,
    type: Envoy.Config.Common.Matcher.V3.HttpGenericBodyMatch,
    json_name: "httpResponseGenericBodyMatch",
    oneof: 0
end

defmodule Envoy.Config.Common.Matcher.V3.HttpHeadersMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
end

defmodule Envoy.Config.Common.Matcher.V3.HttpGenericBodyMatch.GenericTextMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :string_match, 1, type: :string, json_name: "stringMatch", oneof: 0, deprecated: false
  field :binary_match, 2, type: :bytes, json_name: "binaryMatch", oneof: 0, deprecated: false
end

defmodule Envoy.Config.Common.Matcher.V3.HttpGenericBodyMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bytes_limit, 1, type: :uint32, json_name: "bytesLimit"

  field :patterns, 2,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V3.HttpGenericBodyMatch.GenericTextMatch,
    deprecated: false
end