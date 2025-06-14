// Please define the TreasureChest generic custom type
pub type TreasureChest(g) {
  TreasureChest(pswd: String, trs: g)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(g) {
  Unlocked(g)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest.pswd == password {
    True -> Unlocked(chest.trs)
    _    -> WrongPassword
  }
}
