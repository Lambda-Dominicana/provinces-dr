defmodule ProvincesDrTest do
  use ExUnit.Case
  doctest ProvincesDr

  describe "&ProvincesDr.provinces!/0" do
    test "Get all provinces and test (value returned, length, type)" do
      provinces = ProvincesDr.provinces!()

      assert is_list(provinces)
      assert Enum.count(provinces) == 32
      assert provinces == [
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
      ]
    end
  end

  describe "&ProvincesDr.provinces/0" do
    test "Get all provinces with pretty response and test (value returned, length, type)" do
      {:ok, provinces} = ProvincesDr.provinces()

      assert is_list(provinces)
      assert Enum.count(provinces) == 32
      assert provinces == [
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
      ]
    end
  end

  describe "&ProvincesDr.province/1" do
    test "Get error when not found a province by code" do
      {:error, reason} = ProvincesDr.province("nothing")

      assert is_bitstring(reason)
      assert reason == "Not found with this code."
    end

    test "Get province details by correct code" do
      {:ok, province} = ProvincesDr.province("1")

      assert is_list(province)
      assert Keyword.keyword?(province)
      assert Keyword.has_key?(province, :code)
      assert Keyword.has_key?(province, :name)
      assert Keyword.has_key?(province, :municipalities)
      assert Keyword.has_key?(province, :municipal_districts)
    end

    test "Get province details by correct propierties" do
      {:ok, province} = ProvincesDr.province("1")

      assert is_bitstring(province[:code])
      assert is_bitstring(province[:name])
      assert is_list(province[:municipalities])
      assert is_list(province[:municipal_districts])
    end
  end
end
