defmodule ProvincesDr do
  @moduledoc """
  Documentation for `ProvincesDr`.
  """
  @external_resource provinces_path = "provinces/provinces_details.txt"

  alias ProvincesDr.Utils




  # Create functions to provindec municipalities
  for line <- File.stream!(provinces_path, [], :line) do
    [province, municipalities, municipal_districts] = String.split(line, "|")

    {code, name} = Utils.parser_values(province)
    municipalities =
      municipalities
      |> String.split(",", trim: true)
      |> Enum.map(&(Utils.parser_values(&1, ":")))
    municipal_districts =
      municipal_districts
      |> String.split(",", trim: true)
      |> Enum.map(&(Utils.parser_values(&1, ":")))

    def province(unquote(code)) do
      unquote(
        Macro.escape({
          :ok,
          [
            code: code,
            name: name,
            municipalities: municipalities,
            municipal_districts: municipal_districts
          ]
        })
      )
    end
  end

  @doc """
  Hello world.

  ## Examples

      iex> ProvincesDr.hello()
      :world

  """
  def province(), do: province("")
  def province(_code), do: {:error, "Not foun with this code."}
end
