import gleam/string

type Cast {
  Cast(current: String, next: String, pl: String)
}

fn get_vals(num: Int) -> Cast {
  case num {
    10 -> Cast(current: "Ten", next: "nine", pl: "s")
    9 -> Cast(current: "Nine", next: "eight", pl: "s")
    8 -> Cast(current: "Eight", next: "seven", pl: "s")
    7 -> Cast(current: "Seven", next: "six", pl: "s")
    6 -> Cast(current: "Six", next: "five", pl: "s")
    5 -> Cast(current: "Five", next: "four", pl: "s")
    4 -> Cast(current: "Four", next: "three", pl: "s")
    3 -> Cast(current: "Three", next: "two", pl: "s")
    2 -> Cast(current: "Two", next: "one", pl: "s")
    1 -> Cast(current: "One", next: "no", pl: "")
    _ -> Cast(current: "", next: "", pl: "")
  }
}

fn is_one(num: Int) -> String {
  case num == 1 {
    False -> "s"
    True -> ""
  }
}

fn generate_verse(num: Int, take: Int, cnt: Int, acc: String) -> String {
  let store = get_vals(num)
  let verse = 
    store.current <> " green bottle" <> store.pl <> " hanging on the wall,\n"
    <> store.current <> " green bottle" <> store.pl <> " hanging on the wall,\n"
    <> "And if one green bottle should accidentally fall,\n"
    <> "There'll be " <> store.next <> " green bottle" <> is_one(num - 1)
    <> " hanging on the wall."
  case cnt < take {
    True  -> generate_verse(num - 1, take, cnt + 1, acc <> verse <> "\n\n")
    False -> acc
  }
}

pub fn recite(
  start_bottles start_bottles: Int,
  take_down take_down: Int,
) -> String {
  generate_verse(start_bottles, take_down, 0, "")
  |> string.trim
}
