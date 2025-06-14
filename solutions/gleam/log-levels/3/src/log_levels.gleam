import gleam/string

pub type LogEntry {
  LogEntry(
    level: String, message: String
  )
}

pub fn parse_log_line(log_line: String) -> LogEntry {
  case log_line |> string.trim() |> string.split("]: ") {
    ["[" <> lvl, msg] -> LogEntry(lvl |> string.trim(), msg |> string.trim())
    _                 -> LogEntry("","")
  }
}

pub fn message(log_line: String) -> String {
  let LogEntry(_, msg) = parse_log_line(log_line)
  msg
}

pub fn log_level(log_line: String) -> String {
  let LogEntry(lvl, _) = parse_log_line(log_line)
  lvl |> string.lowercase()
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
