defmodule ProvincesDr.MixProject do
  use Mix.Project

  def project do
    [
      app: :provinces_dr,
      version: "0.1.0",
      elixir: "~> 1.10",
      name: "Provinces DR",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      source_url: "https://github.com/Lambda-Dominicana/provinces-dr"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description() do
    """
    Elixir library to get all `Provinces/Municiplaities/Municipal Ditrics`
    of Dominican Republic 🇩🇴.
    """
  end

  defp package do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*  LICENSE*  src),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Lambda-Dominicana/provinces-dr"}
    ]
  end
end
