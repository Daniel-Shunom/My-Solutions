import gleam/float
import gleam/result

pub fn score(x: Float, y: Float) -> Int {
  let result = {
    use xs <- result.try(float.power(x, 2.0))
    use ys <- result.try(float.power(y, 2.0))
    float.square_root(xs +. ys)
  }
  case result.unwrap(result, 0.0) {
    i if {i >. 10.0} -> 0
    i if {i >. 5.0 && i <=. 10.0 } -> 1
    i if {i >. 1.0 && i <=. 5.0  } -> 5
    i if {i >=. 0.0 && i <=. 1.0  } -> 10
    _ -> 0
  }
}
