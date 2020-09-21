import requests

# URL Of api base
URL_PROVINCES = 'http://provinciasrd.raydelto.org/provincias'
URL_MUNICIPALITIES = 'http://provinciasrd.raydelto.org/provincias/{id}/municipios'
URL_MUNICIPAL_DISTRICTS = 'http://provinciasrd.raydelto.org/provincias/{id}/distritos_municipales'

def request_api(url) -> dict:
  return requests.get(url).json().get('data', [])

def get_provinces() -> dict:
  return request_api(URL_PROVINCES)

def get_municipalities(id_province: int) -> dict:
  url = URL_MUNICIPALITIES.format(id=id_province)

  return request_api(url)

def get_municipal_districts(id_province: int) -> None:
  url = URL_MUNICIPAL_DISTRICTS.format(id=id_province)

  return request_api(url)

def save_provinces_details(provinces: list) -> None:
  for province in provinces:
    province_id = province.get("codigo", 0)
    municipalities = ",".join(list(map(
      lambda x: f'{x.get("codigo")}:{x.get("nombre")}',
      get_municipalities(province_id)
    )))
    municipal_districts = ",".join(list(map(
      lambda x: f'{x.get("codigo")}:{x.get("nombre")}',
      get_municipal_districts(province_id)
    )))

    with open('provinces_details.txt', 'a') as fl:
      line = f'{province.get("codigo")},{province.get("nombre")}|{municipalities}|{municipal_districts}\n'
      fl.write(line)

def save_provinces(provinces: list) -> None:
  provinces_parsed = ",".join(list(map(
    lambda x: f'{x.get("codigo")}:{x.get("nombre")}',
    provinces
  )))
  with open('provinces.txt', 'a') as fl:
      fl.write(provinces_parsed)

def main():
  provinces = get_provinces()
  
  # save_provinces(provinces)
  save_provinces_details(provinces)

if __name__ == '__main__':
  main()