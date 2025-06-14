import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

fn mov_left(dir: Direction) -> Direction {
  case dir {
    North -> West
    East -> North
    South -> East
    West -> South
  }
}

fn mov_right(dir: Direction) -> Direction {
  case dir {
    North -> East 
    East -> South
    South -> West 
    West -> North
  }
}

fn advance(dir: Direction, pos: Position)-> Position {
  case dir {
    North -> Position(pos.x, pos.y + 1)
    South -> Position(pos.x, pos.y - 1)
    East -> Position(pos.x + 1, pos.y)
    West -> Position(pos.x - 1, pos.y)
  }
}

fn instr_exec(robot: Robot, instr: String) -> Robot {
  case instr {
    "L" -> Robot(mov_left(robot.direction), robot.position)
    "R" -> Robot(mov_right(robot.direction), robot.position)
    "A" -> Robot(robot.direction, advance(robot.direction, robot.position))
    _ -> robot
  }
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let init_robot = create(direction, position)
  string.to_graphemes(instructions)
  |> list.fold(init_robot, instr_exec)
}
