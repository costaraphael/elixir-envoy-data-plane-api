defmodule Xds.Type.Matcher.V3.Matcher.OnMatch do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :on_match, 0

  field :matcher, 1, type: Xds.Type.Matcher.V3.Matcher, oneof: 0
  field :action, 2, type: Xds.Core.V3.TypedExtensionConfig, oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.SinglePredicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :matcher, 0

  field :input, 1, type: Xds.Core.V3.TypedExtensionConfig, deprecated: false

  field :value_match, 2,
    type: Xds.Type.Matcher.V3.StringMatcher,
    json_name: "valueMatch",
    oneof: 0

  field :custom_match, 3,
    type: Xds.Core.V3.TypedExtensionConfig,
    json_name: "customMatch",
    oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :predicate, 1,
    repeated: true,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate,
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :match_type, 0

  field :single_predicate, 1,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.SinglePredicate,
    json_name: "singlePredicate",
    oneof: 0

  field :or_matcher, 2,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList,
    json_name: "orMatcher",
    oneof: 0

  field :and_matcher, 3,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList,
    json_name: "andMatcher",
    oneof: 0

  field :not_matcher, 4,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate,
    json_name: "notMatcher",
    oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.FieldMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :predicate, 1, type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate, deprecated: false

  field :on_match, 2,
    type: Xds.Type.Matcher.V3.Matcher.OnMatch,
    json_name: "onMatch",
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :matchers, 1,
    repeated: true,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.FieldMatcher,
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap.MapEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Xds.Type.Matcher.V3.Matcher.OnMatch
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :map, 1,
    repeated: true,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap.MapEntry,
    map: true,
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherTree do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :tree_type, 0

  field :input, 1, type: Xds.Core.V3.TypedExtensionConfig, deprecated: false

  field :exact_match_map, 2,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap,
    json_name: "exactMatchMap",
    oneof: 0

  field :prefix_match_map, 3,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap,
    json_name: "prefixMatchMap",
    oneof: 0

  field :custom_match, 4,
    type: Xds.Core.V3.TypedExtensionConfig,
    json_name: "customMatch",
    oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :matcher_type, 0

  field :matcher_list, 1,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList,
    json_name: "matcherList",
    oneof: 0

  field :matcher_tree, 2,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree,
    json_name: "matcherTree",
    oneof: 0

  field :on_no_match, 3, type: Xds.Type.Matcher.V3.Matcher.OnMatch, json_name: "onNoMatch"
end