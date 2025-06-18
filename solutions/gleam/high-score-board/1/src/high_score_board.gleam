import gleam/dict.{type Dict}
import gleam/option.{type Option}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.insert(dict.new(), "The Best Ever", 1000000)
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  dict.insert(score_board, player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  dict.delete(score_board, player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  let handler = fn(val: Option(Int)) {
    case val {
      option.Some(num) -> num + points
      option.None -> points
    }
  }
  case dict.get(score_board, player) {
    Error(_) -> score_board
    Ok(_) -> dict.upsert(score_board, player, handler)
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  let handler = fn(_k, v) { v + 100 }
  dict.map_values(score_board, handler)
}
