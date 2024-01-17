defmodule EnvoyDataPlaneApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :envoy_data_plane_api,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      elixirc_paths: ["lib", "gen"],
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:protobuf, "~> 0.12.0"},
      {:grpc, "~> 0.7"},
      {:google_protos, "~> 0.3"},
      {:jason, "~> 1.0"}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE", "gen", "Makefile"]
    ]
  end
end
