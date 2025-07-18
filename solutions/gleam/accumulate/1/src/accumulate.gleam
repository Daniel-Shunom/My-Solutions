import gleam/list

fn util(list: List(a), fun: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> list.reverse(acc)
    [fs, ..rest] -> util(rest, fun, list.prepend(acc, fun(fs)))
  }
}

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  util(list, fun, [])
}
