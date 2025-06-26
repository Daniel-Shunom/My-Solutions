import gleam/set.{type Set}
import gleam/list
import gleam/result
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.insert(set.new(), card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  let updated_collection = set.insert(collection, card)
  case updated_collection == collection {
    True -> #(True, updated_collection)
    False -> #(False, updated_collection)
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let updated =
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)
  let possible =
    set.contains(collection, my_card)
    && !set.contains(collection, their_card)
  #(possible, updated)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  list.reduce(collections, set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list()
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  list.fold(collections, set.new(), set.union)
  |> set.size()
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, string.starts_with(_, "Shiny "))
}
