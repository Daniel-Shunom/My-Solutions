import gleam/int
import gleam/float
import gleam/string

pub fn pence_to_pounds(pence) {
  //Is this necessary? No, but I like it anyways
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
