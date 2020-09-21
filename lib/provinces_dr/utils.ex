defmodule ProvincesDr.Utils do
  @moduledoc """
  Module of utitlities functions to parser values from files.
  """

  @doc """
  Split text and return a tuple with values.

  ## Examples

      iex> ProvincesDr.parser_values("hole,claro")
      {"hole", "claro"}
      iex> ProvincesDr.parser_values("34:Salcedo", ":")
      {"34", "Salcedo"}
  """
  def parser_values(values), do: parser_values(values, ",")

  def parser_values(values, parser) do
    values
      |> String.split(parser, trim: true)
      |> Enum.map(&String.trim/1)
      |> List.to_tuple
  end
end
