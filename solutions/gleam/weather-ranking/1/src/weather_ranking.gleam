import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32.} /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(a), Celsius(b) -> float.compare(a, b)
    Celsius(a), Fahrenheit(b) -> {
      fahrenheit_to_celsius(b)
      |> float.compare(a, _)
    }
    Fahrenheit(a), Celsius(b) -> {
      fahrenheit_to_celsius(a)
      |> float.compare(b)
    }
    Fahrenheit(a), Fahrenheit(b) -> float.compare(a, b)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(a, b) {
    compare_temperature(a.temperature, b.temperature)
  })
}
