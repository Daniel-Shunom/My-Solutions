import gleam/string
import gleam/list
import gleam/int

fn is_dgt(chr: String) -> Bool {
  chr == "0" || chr == "1" || chr == "2" || chr == "3" || chr == "4" || chr == "5" 
  || chr == "6" || chr == "7" || chr == "8" || chr == "9"
}

fn concat_helper(chr: String, num: Int) -> String {
  case num > 1  {
    True -> int.to_string(num) <> chr
    False -> chr
  }
}

fn check(chr_store: #(Int, String), nchr: String) {
  case chr_store.1 == nchr {
    False -> list.Stop(chr_store)
    True -> list.Continue(#(chr_store.0 + 1, chr_store.1))
  }
}

fn en_helper(lstr: List(String), chr_count: List(#(Int, String))) {
  case lstr {
    [] ->  chr_count
    [fs, ..rest] -> {
      list.fold_until(rest, #(1, fs), check)
      |> fn(x: #(Int, String)) { list.drop(lstr, x.0) |> en_helper(list.append(chr_count, [x]))
      }
    }
  }
}

fn dcd_helper(list_str: List(String), str_acc: String, dgt_cache: List(String)) -> String {
  case list_str {
  [] -> str_acc
  [chr, ..rest] -> 
    case is_dgt(chr) {
      True -> dcd_helper(rest, str_acc, list.append(dgt_cache, [chr]))
      False -> {
        case dgt_cache {
          [] -> dcd_helper(rest, str_acc <> chr, dgt_cache)
          _ -> {
            let num_str = string.concat(dgt_cache)
            let assert Ok(num) = int.parse(num_str) 
            let parsed = string.repeat(chr, num)
            dcd_helper(rest, str_acc <> parsed, [])
          }
        }  
      }
    }
  }
}

pub fn encode(plaintext: String) -> String {
  let new_str: List(String) = string.to_graphemes(plaintext)
  en_helper(new_str, [#(0, "")])
  |> list.map(fn(x) { concat_helper(x.1, x.0)})
  |> string.concat()
}

pub fn decode(ciphertext: String) -> String {
  string.to_graphemes(ciphertext)
  |> dcd_helper("", [])
}
