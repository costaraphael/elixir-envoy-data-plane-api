defmodule EnvoyDataPlaneApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :envoy_data_plane_api,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.7.7", runtime: false}
    ]
  end
end
