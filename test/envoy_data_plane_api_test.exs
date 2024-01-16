defmodule EnvoyDataPlaneApiTest do
  use ExUnit.Case
  doctest EnvoyDataPlaneApi

  test "greets the world" do
    assert EnvoyDataPlaneApi.hello() == :world
  end
end
