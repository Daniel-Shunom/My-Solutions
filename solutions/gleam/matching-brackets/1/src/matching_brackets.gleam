import gleam/string
import gleam/list

fn is_sym(sym: String) -> Bool {
  sym == "[" || sym == "]" || sym == "{" || sym == "}" || sym == "(" || sym == ")"
}

fn matches(opening: String, closing: String) -> Bool {
  case #(opening, closing) {
    #("{", "}") | #("[", "]") | #("(", ")") -> True
    _ -> False
  }
}

fn order_sym(graphemes: List(String), stack: List(String)) -> Bool {
  case graphemes {
    [] -> list.is_empty(stack)
    [chr, ..rest] ->
      case chr {
        "{" | "(" | "[" -> order_sym(rest, list.prepend(stack, chr))
        "}" | ")" | "]" ->
          case stack {
            [top, ..remaining] ->
              matches(top, chr) && order_sym(rest, remaining)
            [] -> False
          }
        _ -> order_sym(rest, stack)
      }
  }
}

pub fn is_paired(value: String) -> Bool {
  value
  |> string.to_graphemes()
  |> list.filter(is_sym)
  |> fn(x) { order_sym(x, []) }
}
