import gleam/string
import gleam/list

pub fn reverse(value: String) -> String {
  string.to_graphemes(value)
  |> list.reverse()
  |> string.concat()
}
