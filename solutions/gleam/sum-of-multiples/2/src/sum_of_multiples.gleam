import gleam/list
import gleam/int 

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(0, limit-1)
  |> list.filter(fn(a){list.any(factors, fn(b){b > 0 && a%b == 0})})
  |> list.fold(0, int.add)
}
 