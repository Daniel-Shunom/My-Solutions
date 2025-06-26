import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(value) = problem
  value
}

pub fn remove_team_prefix(team: String) -> String {
  string.trim(string.drop_start(team, 5))
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert Ok(#(region, team)) = string.split_once(combined, ",")
  #(string.trim(region), remove_team_prefix(team))
}
