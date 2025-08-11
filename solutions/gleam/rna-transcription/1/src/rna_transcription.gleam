import gleam/string

pub fn to_rna(dna: String) -> Result(String, Nil) {
  transcriptor(dna, "")
}

fn transcriptor(dna: String, acc: String) {
  case dna {
    "" -> Ok(acc)
    "G" <> rest -> transcriptor(rest, acc <> "C") 
    "C" <> rest -> transcriptor(rest, acc <> "G") 
    "T" <> rest -> transcriptor(rest, acc <> "A") 
    "A" <> rest -> transcriptor(rest, acc <> "U")
    _ -> Error(Nil)
  }
}