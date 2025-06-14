import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location == #(treasure_location.1, treasure_location.0)
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(str, tpl) = place
  let new_tpl = #(str, place_location_to_treasure_location(tpl))
  list.filter(treasures, fn(x) {x.1 == new_tpl.1})
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(plc, tpl) = place
  let fmt_plc = #(plc, place_location_to_treasure_location(tpl))
  case fmt_plc {
    #("Abandoned LightHouse", loc) -> {
      loc == desired_treasure.1 
      && desired_treasure.0 == "Brass Spyglass"
    }
    #("Stormy Breakwater", loc) -> {
      loc == found_treasure.1 
      && found_treasure.0 == "Amethyst Octopus"
      || desired_treasure.0 == "Crystal Crab"
      || desired_treasure.0 == "Glass Starfish"
    }
    #("Harbor Managers Office", loc) -> {
      loc == desired_treasure.1 
      && desired_treasure.0 == "Vintage Pirate Hat" 
      || desired_treasure.0 == "Model Ship in Large Bottle"
      || desired_treasure.0 == "Antique Glass Fishnet Float"
    }
    _ -> False
  }
}
