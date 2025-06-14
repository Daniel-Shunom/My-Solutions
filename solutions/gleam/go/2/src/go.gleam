import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

fn nxt(plyr: Player) {
  case plyr {
    Black -> White
    White -> Black
  }
}
pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let temp_game =
    rule1(game)
    |> result.map(rule2)
    |> result.then(rule3)
    |> result.then(rule4)
  case temp_game {
    Error(err) -> Game(..game, error: err)
    Ok(newstate) -> Game(..newstate, player: nxt(game.player))
  }
}
