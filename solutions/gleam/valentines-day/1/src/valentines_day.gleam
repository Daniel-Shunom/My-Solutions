// TODO: please define the 'Approval' custom type
pub type Approval {
  Yes
  No
  Maybe
}

// TODO: please define the 'Cuisine' custom type
pub type Cuisine {
  Korean
  Turkish
}

// TODO: please define the 'Genre' custom type
pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

// TODO: please define the 'Activity' custom type
pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill     -> No
    Movie(Romance) -> Yes
    Movie(_)       -> No
    Restaurant(Korean) -> Yes
    Restaurant(_)      -> Maybe
    Walk(i)    -> case i {
      i if 11 < i -> Yes
      i if 6  < i -> Maybe
      _           -> No
    }
  }
}
