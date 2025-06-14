import gleam/string
import gleam/list

pub fn first_letter(name: String) {
  string.trim(name) |> string.first()
  |> fn(x) { let assert Ok(letter) = x 
    letter
  }  
}

pub fn initial(name: String) {
  first_letter(name) |> string.uppercase() <> "."
}

pub fn initials(full_name: String) {
  string.split(full_name, " ")
  |> list.map(initial)
  |> list.intersperse(" ")
  |> string.concat()
}

pub fn pair(full_name1: String, full_name2: String) {
  //      ******       ******
  //    **      **   **      **
  //  **         ** **         **
  // **            *            **
  // **                         **
  // **     X. X.  +  X. X.     **
  //  **                       **
  //    **                   **
  //      **               **
  //        **           **
  //          **       **
  //            **   **
  //              ***
  //               *
  let in1 = initials(full_name1)
  let in2 = initials(full_name2)
  let new_in = in1 <> "  +  " <> in2 
     "\n     ******       ******\n" 
  <> "   **      **   **      **\n"
  <> " **         ** **         **\n"
  <> "**            *            **\n"
  <> "**                         **\n"
  <> "**     " <> new_in <> "     **\n"
  <> " **                       **\n"
  <> "   **                   **\n"
  <> "     **               **\n"
  <> "       **           **\n"
  <> "         **       **\n"
  <> "           **   **\n"
  <> "             ***\n"
  <> "              *\n"
}
