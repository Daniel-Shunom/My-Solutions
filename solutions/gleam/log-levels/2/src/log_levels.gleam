import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
     "[INFO]:" <> r -> r
     "[ERROR]:" <> r -> r
     "[WARNING]:" <> r -> r
      _ -> "None"
  }
  |> string.trim()
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> _r -> "info"
    "[WARNING]:" <> _r -> "warning"
    "[ERROR]:" <> _r -> "error"
     _ -> "invalid error"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
