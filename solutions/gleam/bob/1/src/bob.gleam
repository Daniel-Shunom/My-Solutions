import gleam/string

pub type RemarkType{
  RemarkType(has_q: Bool, has_wht_spc:Bool, is_cap: Bool)
}

fn is_shout(str: String) -> Bool {
  let hl = str != string.lowercase(str)
  let au  = str == string.uppercase(str)
  hl && au
}

fn remark_formatter(str: String)-> RemarkType {
  RemarkType(
    string.ends_with(string.trim(str), "?"),
    string.trim(str) == "",
    is_shout(string.trim(str))
  )
}

fn handle_remark(r: RemarkType)-> String {
  case r.has_wht_spc {
    True -> "Fine. Be that way!"
    _    -> {
      case r.has_q, r.is_cap {
        True, True   -> "Calm down, I know what I'm doing!"
        True, False  -> "Sure."
        False, True  -> "Whoa, chill out!"
        False, False -> "Whatever."
      }
    }
  }
}

pub fn hey(remark: String) -> String {
  remark_formatter(remark) |> handle_remark()
}
