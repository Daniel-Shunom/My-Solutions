pub fn reply(guess: Int) -> String {
  let num: Int = 42
  case guess {
    i if i == num - 1 || i == num + 1 -> "So close"
    i if i > num  -> "Too high" 
    i if i < num -> "Too low" 
    _-> "Correct"
  }
}
