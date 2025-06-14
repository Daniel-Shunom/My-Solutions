import gleam/int

pub fn convert(number: Int) -> String {
  let pling = case number % 3 == 0 { 
    True -> "Pling"
    _    -> ""
  }
  let plang = case number % 5 == 0 { 
    True -> "Plang"
    _    -> ""
  }
  let plong = case number % 7 == 0 { 
    True -> "Plong"
    _    -> ""
  }
  let result = pling <> plang <> plong

  case result {
    "" -> int.to_string(number)
    _ -> result
  }
}
