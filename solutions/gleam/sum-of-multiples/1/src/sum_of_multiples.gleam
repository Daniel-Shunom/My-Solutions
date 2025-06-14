import gleam/list
import gleam/int 

fn pull_factors(fac: Int, lim: Int, itr: Int,  acc: List(Int))-> List(Int) {
  let count = {lim-1}/fac
  case list.length(acc) == count {
    True  -> acc
    False -> pull_factors(fac, lim, itr+1, list.append(acc, [fac*itr]))
  }
}

fn list_concat(l: List(List(Int)), acc: List(Int))-> List(Int) {
  case l {
    [] -> acc
    [a, ..rest] -> list_concat(rest, list.append(a, acc))
  }
}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.map(fn(x){pull_factors(x, limit, 1, [])})
  |> list_concat([])
  |> list.unique()
  |> list.fold(0, int.add)
}
 