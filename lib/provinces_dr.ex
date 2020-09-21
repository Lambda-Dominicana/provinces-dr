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

  ## Examples

      iex> ProvincesDr.provinces()
      {:ok,
        [
          {"1", "Azua"},
          {"2", "Bahoruco"},
          {"3", "Barahona"},
          {"4", "Dajabón"},
          {"5", "Distrito Nacional"},
          {"6", "Duarte"},
          {"7", "Elías Piña"},
          {"8", "El Seibo"},
          {"9", "Espaillat"},
          {"10", "Hato Mayor"},
          {"11", "Hermanas Mirabal"},
          {"12", "Independencia"},
          {"13", "La Altagracia"},
          {"14", "La Romana"},
          {"15", "La Vega"},
          {"16", "María Trinidad Sánchez"},
          {"17", "Monseñor Nouel"},
          {"18", "Monte Cristi"},
          {"19", "Monte Plata"},
          {"20", "Pedernales"},
          {"21", "Peravia"},
          {"22", "Puerto Plata"},
          {"23", "Samaná"},
          {"24", "Sánchez Ramírez"},
          {"25", "San Cristóbal"},
          {"26", "San José de Ocoa"},
          {"27", "San Juan"},
          {"28", "San Pedro de Macorís"},
          {"29", "Santiago"},
          {"30", "Santiago Rodríguez"},
          {"31", "Santo Domingo"},
          {"32", "Valverde"}
        ]}
  """
  def provinces()

  @doc """
  Get all Municipalities and Municipal Disctrics from a provindece code.

  ## Params
      code: Code of province

  ## Examples

      iex> ProvincesDr.province()
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
