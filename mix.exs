defmodule EnvoyDataPlaneApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :envoy_data_plane_api,
      version: "0.2.0",
      description: "Elixir protobuf definitions for Envoy's data plane API",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      elixirc_paths: ["lib", "gen"],
      deps: deps(),
      package: package(),
      source_url: "https://github.com/costaraphael/elixir-envoy-data-plane-api"
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
      {:grpc, "~> 0.9"},
      {:google_protos, "~> 0.4"},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      files: ["mix.exs", "README.md", "LICENSE", "gen", "Makefile"],
      links: %{
        "Github" => "https://github.com/costaraphael/elixir-envoy-data-plane-api"
      }
    ]
  end
end
