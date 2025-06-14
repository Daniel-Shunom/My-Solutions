pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  let s_add = fn(var: Int)-> Int {
    var + secret
  } 
  s_add
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  let s_subtract = fn(var: Int)-> Int {
    var - secret
  }
  s_subtract
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  let s_multiply =  fn(var: Int)-> Int {
    var * secret
  }
  s_multiply
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  let s_divide = fn(var: Int)-> Int {
    var / secret
  }
  s_divide
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  let s_combine = fn(var: Int) {
    var
    |> secret_function1()
    |> secret_function2()
  }
  s_combine
}
