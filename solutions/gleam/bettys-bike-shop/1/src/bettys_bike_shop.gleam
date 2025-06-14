// TODO: import the `gleam/int` module
import gleam/int
// TODO: import the `gleam/float` module
import gleam/float
// TODO: import the `gleam/string` module
import gleam/string

pub fn pence_to_pounds(pence) {
  //todo
  let div = fn(val: Float) {
    val /. 100.0
  }
  int.to_float(pence)
  |> div
}

pub fn pounds_to_string(pounds) {
  float.to_string(pounds)
  |> string.append(to: "£")
}
