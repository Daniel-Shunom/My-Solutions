import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list.filter(list, fn(x) { predicate(x) == True })
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list.filter(list, fn(x) { predicate(x) != True })
}
