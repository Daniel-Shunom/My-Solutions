fn is_triangle(a: Float, b: Float, c: Float)-> Bool {
  a+.b>=.c && b+.c>=.a && a+.c>=.b && a+.b+.c>. 0.0
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    False -> False
    True-> {a == b && a==c && b==c}
  }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    False -> False
    True-> {a == b || a == c || b==c}
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    False -> False
    True-> {a != b && a != c && b!=c}
  }
}
