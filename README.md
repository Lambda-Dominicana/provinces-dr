# Provinces DR 🇩🇴

Elixir library to get all `Provinces/Municiplaities/Municipal Ditrics` of Dominican Republic 🇩🇴.

Created to practice metaprogramming in elixir and the generation of functions using external data. The functions functions `&ProvincesDr.provinces/0` and `&ProvincesDr.province/1` was generated using macros and all dataset is there on file `provinces/provinces.txt` and `provinces/provinces_details.txt`.

## Examples

Get all provinces of Dominican Republic.
```elixir
iex> ProvincesDr.provinces
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
```

Get province's details passing code.
```elixir
iex> ProvincesDr.province "2"
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
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `provinces_dr` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:provinces_dr, "~> 0.1.0"}
  ]
end
```

Created with ❤️ and __λ__ by __Lambda Dominicana 🇩🇴 + λ = ❤️__
