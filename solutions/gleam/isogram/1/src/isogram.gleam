import gleam/string
import gleam/list

pub fn is_isogram(phrase phrase: String) -> Bool {
  string.lowercase(phrase)
  |> string.to_graphemes()
  |> list.filter(fn(x){x != "-" && x != " "})
  |> fn(x) {list.length(x) == list.length(list.unique(x))}
}
