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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    """
    Elixir library to get all `Provinces/Municiplaities/Municipal Ditrics`
    of Dominican Republic 🇩🇴.

    Created to practice metaprogramming in elixir and the generation of
    functions using external data.
    The functions functions `&ProvincesDr.provinces/0` and `&ProvincesDr.province/1`
    was generated using macros and all dataset is there on
    file `provinces/provinces.txt` and `provinces/provinces_details.txt`.
    """
  end

  defp package do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* readme* LICENSE*
                license* src),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Lambda-Dominicana/provinces-dr"}
    ]
  end
end
