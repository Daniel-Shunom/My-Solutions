fn builder(n: Int, s: String, tbl: List(#(Int, String)))-> String {
  case tbl {
    [] -> s
    [#(val, sym) ..rest] -> {
      case n >= val {
        True  -> builder(n-val, s <> sym, tbl)
        False -> builder(n, s, rest)
      }
    }
  }
}

pub fn convert(number: Int) -> String {
  let nmrls = [
    #(1000, "M"),
    #(900, "CM"),
    #(500, "D"),
    #(400, "CD"),
    #(100, "C"),
    #(90, "XC"),
    #(50, "L"),
    #(40, "XL"),
    #(10, "X"),
    #(9, "IX"),
    #(5, "V"),
    #(4, "IV"),
    #(1, "I"),
  ]

  case number <=3999 {
    True  -> builder(number, "", nmrls)
    False -> panic
  }
}
