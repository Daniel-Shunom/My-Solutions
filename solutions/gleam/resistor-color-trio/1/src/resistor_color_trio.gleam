import gleam/result
import gleam/int
import gleam/float

pub type Resistance {
  Resistance(unit: String, value: Int)
}

fn color_value(color: String) -> Result(Int, Nil) {
  case color {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}

fn scale_resistance(value: Int) -> Resistance {
  case value {
    v if v >= 1_000_000_000 -> Resistance("gigaohms", v / 1_000_000_000)
    v if v >= 1_000_000 -> Resistance("megaohms", v / 1_000_000)
    v if v >= 1_000 -> Resistance("kiloohms", v / 1_000)
    _ -> Resistance("ohms", value)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors {
    [first, second, third, ..] -> {
      use fs <- result.try(color_value(first))
      use sn <- result.try(color_value(second))
      use ex <- result.try(color_value(third))
      use exp <- result.try(int.power(10, int.to_float(ex)))
      let exponent = float.round(exp)
      let value = fs * 10 + sn
      let resistance = value * exponent
      Ok(scale_resistance(resistance))
    }
    _ -> Error(Nil)
  }
}
