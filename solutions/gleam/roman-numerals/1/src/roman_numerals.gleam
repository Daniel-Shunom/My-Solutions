pub type ParseRecord {
  ParseRecord(nmrl: String, rem: Int)
}

fn m_parse (var: ParseRecord)-> ParseRecord {
  case var.rem {
    i if {i >= 1000} -> m_parse(ParseRecord(var.nmrl <> "M", var.rem - 1000))
    i if {900 <= i && i < 1000} -> m_parse(ParseRecord(var.nmrl <> "CM", var.rem - 900))
    _ -> var
  }
  
}

fn d_parse (var: ParseRecord)-> ParseRecord {
  case var.rem {
    i if {400 <= i && i < 500} -> ParseRecord(var.nmrl <> "CD", var.rem - 400)
    i if {500 <= i && i < 900} -> ParseRecord(var.nmrl <> "D", var.rem - 500)
    _ -> var
  }
}

fn c_parse(var: ParseRecord)-> ParseRecord {
  case var.rem {
    i if {100 <= i && i < 400} -> c_parse(ParseRecord(var.nmrl <> "C", var.rem - 100))
    i if {600 <= i && i < 900} -> c_parse(ParseRecord(var.nmrl <> "C", var.rem - 100))
    i if {90 <= i && i < 100}  -> c_parse(ParseRecord(var.nmrl <> "XC", var.rem - 90))
    _ -> var
  }
}

fn l_parse(var: ParseRecord)-> ParseRecord {
  case var.rem {
    i if {40 <= i && i < 50} -> ParseRecord(var.nmrl <> "XL", var.rem - 40)
    i if {50 <= i && i < 90} -> ParseRecord(var.nmrl <> "L", var.rem - 50)
    _ -> var
  }
}

fn x_parse(var: ParseRecord)-> ParseRecord {
  case var.rem {
    i if {10 <= i && i < 40} -> x_parse(ParseRecord(var.nmrl <> "X", var.rem - 10))
    i if {60 <= i && i < 90} -> x_parse(ParseRecord(var.nmrl <> "X", var.rem - 10))
    i if {9 <= i && i < 10}  -> x_parse(ParseRecord(var.nmrl <> "IX", var.rem - 9))
    _ -> var
  }
}

fn v_parse(var: ParseRecord)-> ParseRecord {
  case var.rem {
    i if {4 <= i && i < 5} -> ParseRecord(var.nmrl <> "IV", var.rem - 4)
    i if {5 <= i && i < 9} -> ParseRecord(var.nmrl <> "V", var.rem - 5)
    _ -> var
  }
}

fn i_parse(var: ParseRecord)-> ParseRecord {
  case {1 <= var.rem && var.rem < 4} || {6 <= var.rem && var.rem < 9} {
    True  -> i_parse(ParseRecord(var.nmrl <> "I", var.rem - 1))
    False -> var
  }
}

fn parser(n: Int)-> String {
  m_parse(ParseRecord(nmrl: "", rem: n))
  |> d_parse() |> c_parse()
  |> l_parse() |> x_parse()
  |> v_parse() |> i_parse()
  |> fn(record) {record.nmrl}
}

pub fn convert(number: Int) -> String {
  case number <= 3999 {
    True  -> parser(number)
    _     -> panic 
  }
}
