import gleam/string

type Cast {
  Cast(current: String, next: String)
}

fn get_vals(num: Int) -> Cast {
  case num {
    10 -> Cast(current: "Ten", next: "nine")
    9 -> Cast(current: "Nine", next: "eight")
    8 -> Cast(current: "Eight", next: "seven")
    7 -> Cast(current: "Seven", next: "six")
    6 -> Cast(current: "Six", next: "five")
    5 -> Cast(current: "Five", next: "four")
    4 -> Cast(current: "Four", next: "three")
    3 -> Cast(current: "Three", next: "two")
    2 -> Cast(current: "Two", next: "one")
    1 -> Cast(current: "One", next: "no")
    _ -> Cast(current: "", next: "")
  }
}

fn plural(num: Int) -> String {
  case num == 1 {
    False -> "s"
    True -> ""
  }
}

fn generate_verse(num: Int, take: Int, cnt: Int, acc: String) -> String {
  let store = get_vals(num)
  let verse = 
    string.concat([store.current, " green bottle", plural(num), " hanging on the wall,\n"])
    |> string.repeat(2) <> "And if one green bottle should accidentally fall,\n"
    <> "There'll be " <> store.next <> " green bottle" <> plural(num - 1)
    <> " hanging on the wall."
  case cnt < take {
    True  -> generate_verse(num - 1, take, cnt + 1, acc <> verse <> "\n\n")
    False -> string.trim(acc)
  }
}

pub fn recite(
  start_bottles start_bottles: Int,
  take_down take_down: Int,
) -> String {
  generate_verse(start_bottles, take_down, 0, "")
}
