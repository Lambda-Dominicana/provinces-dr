defmodule ProvincesDr do
  @moduledoc """
  Documentation for `ProvincesDr`.
  """
  @external_resource provinces_path = "provinces/provinces.txt"
  @external_resource provinces_details_path = "provinces/provinces_details.txt"

  alias ProvincesDr.Utils

  # craete functions to get all provinces
  for line <- File.stream!(provinces_path, [], :line) do
    provinces =
      line
      |> String.split(",", trim: true)
      |> Enum.map(&(Utils.parser_values(&1, ":")))

    def provinces() do
      unquote(
        Macro.escape({ :ok, provinces})
      )
    end
  end


  # Create functions to provindec municipalities
  for line <- File.stream!(provinces_details_path, [], :line) do
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
  Get all provinces.
  """
  def provinces()

  @doc """
  Get all Municipalities and Municipal Disctrics from a provindece code.

  ## Examples

      iex> ProvincesDr.province()
      {:error, "Not foun with this code."}
      iex> ProvincesDr.province("1000")
      {:error, "Not foun with this code."}
      iex> ProvincesDr.province("2")
      {:ok,
        [
          code: "2",
          name: "Bahoruco",
          municipalities: [
            {"12", "Neiba"},
            {"13", "Galván"},
            {"14", "Los Ríos"},
            {"15", "Tamayo"},
            {"16", "Villa Jaragua"}
          ],
          municipal_districts: [
            {"23", "El Palmar"},
            {"24", "El Salado"},
            {"25", "Las Clavellinas"},
            {"26", "Cabeza de Toro"},
            {"27", "Mena"},
            {"28", "Monserrat"},
            {"29", "Santa Bárbara-El 6"},
            {"30", "Santana"},
            {"31", "Uvilla"}
          ]
        ]}

  """
  def province(_code), do: {:error, "Not found with this code."}
end
