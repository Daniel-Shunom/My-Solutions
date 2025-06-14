import gleam/list

// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(val) -> 1 + pizza_price(val)
    ExtraToppings(val) -> 2 + pizza_price(val)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let handler = fn(x, p) { x + pizza_price(p) }
  case order {
    [item] -> 3 + pizza_price(item)
    [_, _] -> 2 + list.fold(order, 0, handler)
    _ -> list.fold(order, 0, handler)
  }
}
