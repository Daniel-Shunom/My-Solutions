import gleam/list
import gleam/int
import gleam/result

pub fn today(days: List(Int)) -> Int {
  result.unwrap(list.first(days), 0)
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  [today(days) + 1, ..result.unwrap(list.rest(days), [])]
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.contains(days, 0)
}

pub fn total(days: List(Int)) -> Int {
  int.sum(days)
}

pub fn busy_days(days: List(Int)) -> Int {
  list.filter(days, fn(x) { x >= 5}) |> list.length()
}
