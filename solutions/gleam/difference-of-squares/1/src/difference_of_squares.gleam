import gleam/int

pub fn square_of_sum(n: Int) -> Int {
  let sqrsum = fn(n) {
    let var = {n * {n+1}}/2 
    var * var
  }
  
  case n {
    0-> 0
    _-> sqrsum(n)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  let smsqr = fn(n) {
    let var = {n * {n+1} * {{2*n}+1}}/6
    var
  }
  case n {
    0-> 0
    _-> smsqr(n)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
