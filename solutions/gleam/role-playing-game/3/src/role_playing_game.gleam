import gleam/option.{type Option, Some, None}
import gleam/int

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
  case player.mana {
    Some(m) if m >= cost -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    Some(_) -> #(player, 0)
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
  }
}
