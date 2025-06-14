import gleam/option.{type Option, Some, None}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  let p = player
  case player.level >= 10, player.health == 0 {
    True, True -> Some(Player(p.name, p.level, 100, Some(100)))
    False, True -> Some(Player(p.name, p.level, 100, p.mana))
    _, _ -> None
  } 
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  let p = player
  case p.mana {
    Some(mana) -> case mana - cost >= 0 {
      True -> #(Player(p.name, p.level, p.health, Some(mana - cost)), 2 * cost)
      False -> #(player, 0)
    }
    None -> case p.health > cost  {
      True -> #(Player(p.name, p.level, p.health - cost, None), 0)
      False -> #(Player(p.name, p.level, 0, None), 0)
    }
  }
}
