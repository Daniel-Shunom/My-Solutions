import simplifile
import gleam/result
import gleam/string.{trim}
import gleam/list

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok(list) -> Ok(string.split(trim(list), "\n"))
    _ -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case simplifile.create_file(path) {
    Error(_) -> Error(Nil)
    _ -> Ok(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(path, email <> "\n")
  |> result.map_error(fn(_) { Nil })
}

fn mapper(var: a, mod: fn(a) -> b) -> Result(b, b) {
  Ok(mod(var))
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  create_log_file(log_path)
  use l <- result.try(read_emails(emails_path))
  use ll <- mapper(l)
  use email <- list.each(ll)
  case send_email(email) {
    Error(_) -> Error(Nil)
    Ok(_) -> log_sent_email(log_path, email)
  }
}
