import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
     "[INFO]:" <> r    -> string.trim(r)
     "[ERROR]:" <> r   -> string.trim(r)
     "[WARNING]:" <> r -> string.trim(r)
      _                -> "None"
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> _r    -> "info"
    "[WARNING]:" <> _r -> "warning"
    "[ERROR]:" <> _r   -> "error"
     _                 -> "None"
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> r    -> string.trim(r) <> " (info)"
    "[ERROR]:" <> r   -> string.trim(r) <> " (error)"
    "[WARNING]:" <> r -> string.trim(r) <> " (warning)"
     _                -> "None"
  }
}
