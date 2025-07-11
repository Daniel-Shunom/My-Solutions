import gleam/list

pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  list.filter(wines, fn(x) { x.color == color})
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  list.filter(wines, fn(x) { x.country == country})
}

// Please define the required labelled arguments for this function
pub fn filter(wines wines: List(Wine), color colors: Color, country country: String) -> List(Wine) {
  list.filter(wines, fn(x) {x.country == country && x.color == colors})
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
